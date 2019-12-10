defmodule SafedocWeb.OccupationController do
  use SafedocWeb, :controller

  alias Safedoc.Repo
  alias Safedoc.Account
  alias Safedoc.Setting
  alias Safedoc.Setting.Occupation

  def index(conn, %{"collaborator_id" => collaborator_id}) do
    collaborator = Account.get_collaborator!(collaborator_id)
    occupations = Setting.list_occupations(collaborator_id) |> Repo.preload([:step])
    render(conn, "index.html", occupations: occupations, collaborator: collaborator)
  end

  def new(conn, %{"collaborator_id" => collaborator_id}) do
    collaborator = Account.get_collaborator!(collaborator_id)
    changeset = Setting.change_occupation(%Occupation{})
    render(conn, "new.html", changeset: changeset, collaborator: collaborator)
  end

  def create(conn, %{"occupation" => occupation_params, "collaborator_id" => collaborator_id}) do
    collaborator = Account.get_collaborator!(collaborator_id)
    occupation_params = occupation_params |> Map.put("collaborator_id", collaborator_id) |> Map.put("date_start", NaiveDateTime.utc_now)
    case Setting.create_occupation(occupation_params) do
      {:ok, occupation} ->
        conn
        |> put_flash(:info, "Occupation created successfully.")
        |> redirect(to: Routes.collaborator_occupation_path(conn, :index, collaborator))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, collaborator: collaborator)
    end
  end

  def show(conn, %{"id" => id, "collaborator_id" => collaborator_id}) do
    collaborator = Account.get_collaborator!(collaborator_id)
    occupation = Setting.get_occupation!(id) |> Repo.preload([:step])
    render(conn, "show.html", occupation: occupation, collaborator: collaborator)
  end

  def edit(conn, %{"id" => id, "collaborator_id" => collaborator_id}) do
    collaborator = Account.get_collaborator!(collaborator_id)
    occupation = Setting.get_occupation!(id) |> Repo.preload([:step])
    changeset = Setting.change_occupation(occupation)
    render(conn, "edit.html", occupation: occupation, changeset: changeset, collaborator: collaborator)
  end

  def update(conn, %{"id" => id, "collaborator_id" => collaborator_id, "occupation" => occupation_params}) do
    occupation = Setting.get_occupation!(id) |> Repo.preload([:step])
    collaborator = Account.get_collaborator!(collaborator_id)
    case Setting.update_occupation(occupation, occupation_params) do
      {:ok, occupation} ->
        conn
        |> put_flash(:info, "Occupation updated successfully.")
        |> redirect(to: Routes.collaborator_occupation_path(conn, :index, collaborator))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", occupation: occupation, changeset: changeset, collaborator: collaborator)
    end
  end

  def delete(conn, %{"id" => id, "collaborator_id" => collaborator_id}) do
    collaborator = Account.get_collaborator!(collaborator_id)
    occupation = Setting.get_occupation!(id) |> Repo.preload([:step])
    {:ok, _occupation} = Setting.delete_occupation(occupation)

    conn
    |> put_flash(:info, "Occupation deleted successfully.")
    |> redirect(to: Routes.collaborator_occupation_path(conn, :index, collaborator))
  end
end
