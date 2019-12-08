defmodule SafedocWeb.ContainersServiceController do
  use SafedocWeb, :controller

  alias Safedoc.Setting
  alias Safedoc.Setting.ContainersService

  def index(conn, _params) do
    containers_services = Setting.list_containers_services()
    render(conn, "index.html", containers_services: containers_services)
  end

  def new(conn, _params) do
    changeset = Setting.change_containers_service(%ContainersService{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"containers_service" => containers_service_params}) do
    case Setting.create_containers_service(containers_service_params) do
      {:ok, containers_service} ->
        conn
        |> put_flash(:info, "Containers service created successfully.")
        |> redirect(to: Routes.containers_service_path(conn, :show, containers_service))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    containers_service = Setting.get_containers_service!(id)
    render(conn, "show.html", containers_service: containers_service)
  end

  def edit(conn, %{"id" => id}) do
    containers_service = Setting.get_containers_service!(id)
    changeset = Setting.change_containers_service(containers_service)
    render(conn, "edit.html", containers_service: containers_service, changeset: changeset)
  end

  def update(conn, %{"id" => id, "containers_service" => containers_service_params}) do
    containers_service = Setting.get_containers_service!(id)

    case Setting.update_containers_service(containers_service, containers_service_params) do
      {:ok, containers_service} ->
        conn
        |> put_flash(:info, "Containers service updated successfully.")
        |> redirect(to: Routes.containers_service_path(conn, :show, containers_service))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", containers_service: containers_service, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    containers_service = Setting.get_containers_service!(id)
    {:ok, _containers_service} = Setting.delete_containers_service(containers_service)

    conn
    |> put_flash(:info, "Containers service deleted successfully.")
    |> redirect(to: Routes.containers_service_path(conn, :index))
  end
end
