defmodule SafedocWeb.IndexerController do
  use SafedocWeb, :controller

  alias Safedoc.Repo
  alias Safedoc.Setting
  alias Safedoc.Setting.Indexer

  def index(conn, %{"activity_id" => activity_id}) do
    activity = Setting.get_activity!(activity_id) |> Repo.preload([:indexers])
    indexers = activity.indexers
    render(conn, "index.html", indexers: indexers, activity: activity)
  end

  def new(conn, %{"activity_id" => activity_id}) do
    activity = Setting.get_activity!(activity_id)
    changeset = Setting.change_indexer(%Indexer{})
    render(conn, "new.html", changeset: changeset, activity: activity)
  end

  def create(conn, %{"activity_id" => activity_id, "indexer" => indexer_params}) do
    activity = Setting.get_activity!(activity_id)
    indexer_params = indexer_params |> Map.put("activity_id", activity_id)
    case Setting.create_indexer(indexer_params) do
      {:ok, indexer} ->
        conn
        |> put_flash(:info, "Indexer created successfully.")
        |> redirect(to: Routes.activity_indexer_path(conn, :index, activity))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, activity: activity)
    end
  end

  def show(conn, %{"id" => id, "activity_id" => activity_id}) do
    activity = Setting.get_activity!(activity_id)
    indexer = Setting.get_indexer!(id)
    render(conn, "show.html", indexer: indexer, activity: activity)
  end

  def edit(conn, %{"id" => id, "activity_id" => activity_id}) do
    activity = Setting.get_activity!(activity_id)
    indexer = Setting.get_indexer!(id)
    changeset = Setting.change_indexer(indexer)
    render(conn, "edit.html", indexer: indexer, changeset: changeset, activity: activity)
  end

  def update(conn, %{"id" => id, "indexer" => indexer_params, "activity_id" => activity_id}) do
    indexer = Setting.get_indexer!(id)
    activity = Setting.get_activity!(activity_id)
    case Setting.update_indexer(indexer, indexer_params) do
      {:ok, indexer} ->
        conn
        |> put_flash(:info, "Indexer updated successfully.")
        |> redirect(to: Routes.activity_indexer_path(conn, :index, activity))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", indexer: indexer, changeset: changeset, activity: activity)
    end
  end

  def delete(conn, %{"id" => id, "activity_id" => activity_id}) do
    activity = Setting.get_activity!(activity_id)
    indexer = Setting.get_indexer!(id)
    {:ok, _indexer} = Setting.delete_indexer(indexer)

    conn
    |> put_flash(:info, "Indexer deleted successfully.")
    |> redirect(to: Routes.activity_indexer_path(conn, :index, activity))
  end
end
