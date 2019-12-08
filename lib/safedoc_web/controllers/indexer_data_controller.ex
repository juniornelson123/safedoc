defmodule SafedocWeb.IndexerDataController do
  use SafedocWeb, :controller

  alias Safedoc.Setting
  alias Safedoc.Setting.IndexerData

  def index(conn, _params) do
    name = Setting.list_name()
    render(conn, "index.html", name: name)
  end

  def new(conn, _params) do
    changeset = Setting.change_indexer_data(%IndexerData{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"indexer_data" => indexer_data_params}) do
    case Setting.create_indexer_data(indexer_data_params) do
      {:ok, indexer_data} ->
        conn
        |> put_flash(:info, "Indexer data created successfully.")
        |> redirect(to: Routes.indexer_data_path(conn, :show, indexer_data))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    indexer_data = Setting.get_indexer_data!(id)
    render(conn, "show.html", indexer_data: indexer_data)
  end

  def edit(conn, %{"id" => id}) do
    indexer_data = Setting.get_indexer_data!(id)
    changeset = Setting.change_indexer_data(indexer_data)
    render(conn, "edit.html", indexer_data: indexer_data, changeset: changeset)
  end

  def update(conn, %{"id" => id, "indexer_data" => indexer_data_params}) do
    indexer_data = Setting.get_indexer_data!(id)

    case Setting.update_indexer_data(indexer_data, indexer_data_params) do
      {:ok, indexer_data} ->
        conn
        |> put_flash(:info, "Indexer data updated successfully.")
        |> redirect(to: Routes.indexer_data_path(conn, :show, indexer_data))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", indexer_data: indexer_data, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    indexer_data = Setting.get_indexer_data!(id)
    {:ok, _indexer_data} = Setting.delete_indexer_data(indexer_data)

    conn
    |> put_flash(:info, "Indexer data deleted successfully.")
    |> redirect(to: Routes.indexer_data_path(conn, :index))
  end
end
