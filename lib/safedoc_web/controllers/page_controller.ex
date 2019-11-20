defmodule SafedocWeb.PageController do
  use SafedocWeb, :controller
  alias Safedoc.Account
  alias Safedoc.Account.Customer

  def index(conn, _params) do
    customers = Account.list_customers()
    user = Guardian.Plug.current_resource(conn)
    render(conn, "index.html", customers: customers)
  end
end
