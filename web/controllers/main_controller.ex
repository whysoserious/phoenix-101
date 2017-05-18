defmodule Czynopimy.MainController do
  use Czynopimy.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

end
