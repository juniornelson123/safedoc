defmodule SafedocWeb.CustomerController do
  use SafedocWeb, :controller

  alias Safedoc.Repo
  alias Safedoc.Account
  alias Safedoc.Account.Customer
  alias Safedoc.Account.User

  def index(conn, _params) do
    customers = Account.list_customers() |> Repo.preload([:user])
    render(conn, "index.html", customers: customers)
  end

  def new(conn, _params) do
    changeset = Account.change_customer(%Customer{}) |> Ecto.Changeset.put_assoc(:user, %Account.User{}) 
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"customer" => customer_params}) do
    case Account.create_customer(customer_params) do
      {:ok, customer} ->
        conn
        |> put_flash(:info, "Customer created successfully.")
        |> redirect(to: Routes.customer_path(conn, :show, customer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    customer = Account.get_customer!(id) |> Repo.preload([:user])
    render(conn, "show.html", customer: customer)
  end

  def edit(conn, %{"id" => id}) do
    customer = Account.get_customer!(id) |> Repo.preload(:user)
    changeset = Account.change_customer(customer) 
    render(conn, "edit.html", customer: customer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "customer" => customer_params}) do
    IO.inspect customer_params
    customer = Account.get_customer!(id)  |> Repo.preload(:user)

    case Account.update_customer(customer, customer_params) do
      {:ok, customer} ->
        conn
        |> put_flash(:info, "Customer updated successfully.")
        |> redirect(to: Routes.customer_path(conn, :show, customer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", customer: customer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    customer = Account.get_customer!(id)
    {:ok, _customer} = Account.delete_customer(customer)

    conn
    |> put_flash(:info, "Customer deleted successfully.")
    |> redirect(to: Routes.customer_path(conn, :index))
  end
end
