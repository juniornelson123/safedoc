defmodule SafedocWeb.PageController do
  use SafedocWeb, :controller

  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    render(conn, "index.html")
  end
end
