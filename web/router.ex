defmodule Czynopimy.Router do
  use Czynopimy.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :assign_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Czynopimy do
    pipe_through :browser

    resources "/participants", ParticipantController
    get "/", MainController, :index
  end

  scope "/auth", Czynopimy do
    pipe_through :browser

    get "/login", AuthController, :login
    get "/callback", AuthController, :callback
    delete "/logout", AuthController, :delete
  end

  defp assign_current_user(conn, _) do
    assign(conn, :current_user, get_session(conn, :current_user))
  end

end
