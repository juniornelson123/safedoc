defmodule SafedocWeb.CategoryController do
  use SafedocWeb, :controller

  alias Safedoc.Repo
  alias Safedoc.Archive
  alias Safedoc.Archive.Category

  def index(conn, _params) do
    categories = Archive.list_categories() |> Repo.preload([:category])
    render(conn, "index.html", categories: categories)
  end

  def new(conn, _params) do
    changeset = Archive.change_category(%Category{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"category" => category_params}) do
    case Archive.create_category(category_params) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "Category created successfully.")
        |> redirect(to: Routes.category_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    category = Archive.get_category!(id)
    render(conn, "show.html", category: category)
  end

  def edit(conn, %{"id" => id}) do
    category = Archive.get_category!(id)
    changeset = Archive.change_category(category)
    render(conn, "edit.html", category: category, changeset: changeset)
  end

  def update(conn, %{"id" => id, "category" => category_params}) do
    category = Archive.get_category!(id)

    case Archive.update_category(category, category_params) do
      {:ok, category} ->
        conn
        |> put_flash(:info, "Category updated successfully.")
        |> redirect(to: Routes.category_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", category: category, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    category = Archive.get_category!(id)
    {:ok, _category} = Archive.delete_category(category)

    conn
    |> put_flash(:info, "Category deleted successfully.")
    |> redirect(to: Routes.category_path(conn, :index))
  end
end
