defmodule Safedoc.Account.ErrorHandler do
  import Plug.Conn

  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {type, _reason}, _opts) do
    body = to_string(type)
    conn
    |> Phoenix.Controller.redirect(to: SafedocWeb.Router.Helpers.session_path(conn, :new))
  end

  def unauthenticated(conn, _params) do
    IO.puts "Nao autenticado"
  end
end
