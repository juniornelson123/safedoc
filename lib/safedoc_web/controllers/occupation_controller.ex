defmodule SafedocWeb.OccupationController do
  use SafedocWeb, :controller

  alias Safedoc.Setting
  alias Safedoc.Setting.Occupation

  def index(conn, _params) do
    occupations = Setting.list_occupations()
    render(conn, "index.html", occupations: occupations)
  end

  def new(conn, _params) do
    changeset = Setting.change_occupation(%Occupation{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"occupation" => occupation_params}) do
    case Setting.create_occupation(occupation_params) do
      {:ok, occupation} ->
        conn
        |> put_flash(:info, "Occupation created successfully.")
        |> redirect(to: Routes.occupation_path(conn, :show, occupation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    occupation = Setting.get_occupation!(id)
    render(conn, "show.html", occupation: occupation)
  end

  def edit(conn, %{"id" => id}) do
    occupation = Setting.get_occupation!(id)
    changeset = Setting.change_occupation(occupation)
    render(conn, "edit.html", occupation: occupation, changeset: changeset)
  end

  def update(conn, %{"id" => id, "occupation" => occupation_params}) do
    occupation = Setting.get_occupation!(id)

    case Setting.update_occupation(occupation, occupation_params) do
      {:ok, occupation} ->
        conn
        |> put_flash(:info, "Occupation updated successfully.")
        |> redirect(to: Routes.occupation_path(conn, :show, occupation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", occupation: occupation, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    occupation = Setting.get_occupation!(id)
    {:ok, _occupation} = Setting.delete_occupation(occupation)

    conn
    |> put_flash(:info, "Occupation deleted successfully.")
    |> redirect(to: Routes.occupation_path(conn, :index))
  end
end
