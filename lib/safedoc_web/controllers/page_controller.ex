defmodule SafedocWeb.PageController do
  use SafedocWeb, :controller
  alias Safedoc.Repo
  alias Safedoc.Account
  alias Safedoc.Archive
  alias Safedoc.Account.Customer

  def index(conn, _params) do
    customers = Account.list_customers(3) |> Repo.preload(:user)
    customers_all = Enum.count(Account.list_customers(3) |> Repo.preload(:user))
    collaborators = Enum.count(Account.list_collaborators)
    documents = Enum.count(Archive.list_documents)
    services = Enum.count(Archive.list_services)
    user = Guardian.Plug.current_resource(conn)
    render(conn, "index.html", customers: customers, collaborators: collaborators, documents: documents, services: services, customers_all: customers_all)
  end
end
