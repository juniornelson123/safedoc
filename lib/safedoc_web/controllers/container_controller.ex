defmodule SafedocWeb.ContainerController do
  use SafedocWeb, :controller

  alias Safedoc.Repo
  alias Safedoc.Archive
  alias Safedoc.Archive.Container

  plug :put_layout, "session.html" when action in [:show]


  def index(conn, _params) do
    containers = Archive.list_containers() |> Repo.preload([:category])
    render(conn, "index.html", containers: containers)
  end

  def new(conn, _params) do
    changeset = Archive.change_container(%Container{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"container" => %{"category_id" => category_id, "cont" => cont}}) do
    category = Archive.get_category!(category_id)

    case Repo.transaction(fn ->
      {parse_cont, _} = Integer.parse(cont)
      Enum.to_list(1..parse_cont) |> Enum.each(fn item ->
        container_params = %{code: get_code(category.prefix, category.sufix), category_id: category_id}
        case Archive.create_container(container_params) do
          {:ok, container} ->
            {:ok, container}
          {:error, %Ecto.Changeset{} = changeset} ->
            Repo.rollback("Cannot create containers")
        end
      end)
    end) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Container created successfully.")
        |> redirect(to: Routes.container_path(conn, :index))
      {:error, _} ->
        render(conn, "new.html")
    end
  end

  def show(conn, %{"id" => id}) do
    container = Archive.get_container!(id) |> Repo.preload([:category])
    qr_code_svg = container.code
      |> EQRCode.encode()
      |> EQRCode.png()
      |> Base.encode64
    render(conn, "show.html", container: container, qrcode: qr_code_svg )
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

  defp get_code(prefix, sufix) do
    "#{prefix}#{:os.system_time}#{sufix}"
  end
end
