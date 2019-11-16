defmodule SafedocWeb.ContainerController do
  use SafedocWeb, :controller

  alias Safedoc.Archive
  alias Safedoc.Archive.Container

  def index(conn, _params) do
    containers = Archive.list_containers()
    render(conn, "index.html", containers: containers)
  end

  def new(conn, _params) do
    changeset = Archive.change_container(%Container{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"container" => container_params}) do
    case Archive.create_container(container_params) do
      {:ok, container} ->
        conn
        |> put_flash(:info, "Container created successfully.")
        |> redirect(to: Routes.container_path(conn, :show, container))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    container = Archive.get_container!(id)
    render(conn, "show.html", container: container)
  end

  def edit(conn, %{"id" => id}) do
    container = Archive.get_container!(id)
    changeset = Archive.change_container(container)
    render(conn, "edit.html", container: container, changeset: changeset)
  end

  def update(conn, %{"id" => id, "container" => container_params}) do
    container = Archive.get_container!(id)

    case Archive.update_container(container, container_params) do
      {:ok, container} ->
        conn
        |> put_flash(:info, "Container updated successfully.")
        |> redirect(to: Routes.container_path(conn, :show, container))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", container: container, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    container = Archive.get_container!(id)
    {:ok, _container} = Archive.delete_container(container)

    conn
    |> put_flash(:info, "Container deleted successfully.")
    |> redirect(to: Routes.container_path(conn, :index))
  end
end
