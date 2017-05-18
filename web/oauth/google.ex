defmodule Google do
  require Logger
  use OAuth2.Strategy

  alias OAuth2.Strategy.AuthCode

  defp config do
    [strategy: Google,
     site: "https://accounts.google.com",
     authorize_url: "/o/oauth2/auth",
     token_url: "/o/oauth2/token"]
  end

  def client do                 # TODO val ?
    Application.get_env(:czynopimy, Google)
    |> Keyword.merge(config())
    |> OAuth2.Client.new()
  end

  def authorize_url!(params \\ []) do
    OAuth2.Client.authorize_url!(client(), Keyword.merge(params, scope: "https://www.googleapis.com/auth/userinfo.email"))
  end

  def get_token!(code) do
    OAuth2.Client.get_token!(client(), [code: code, client_secret: client().client_secret])
  end

  def get_user!(client) do
    %{body: user} = OAuth2.Client.get!(client, "https://www.googleapis.com/plus/v1/people/me/openIdConnect")
    %{id: user["sub"], name: user["given_name"], avatar: user["picture"]}
  end

  # Strategy callbacks
  # TODO should be behavior

  def authorize_url(client, params) do
    AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_header("Accept", "application/json")
    |> AuthCode.get_token(params, headers)
  end

end
