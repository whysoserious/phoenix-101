defmodule Czynopimy.AuthController do
  use Czynopimy.Web, :controller

  def login(conn, _params) do
    redirect(conn, external: Google.authorize_url!())
  end

  def callback(conn, %{"code" => code}) do
    client = Google.get_token!(code)
    user = Google.get_user!(client)
    conn
    |> put_session(:current_user, user)
    |> put_session(:access_token, client.token.access_token)
    |> redirect(to: "/")
  end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "You have been logged out!")
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end

end
