defmodule SafedocWeb.CollaboratorController do
  use SafedocWeb, :controller

  alias Safedoc.Repo
  alias Safedoc.Account
  alias Safedoc.Account.Collaborator

  def index(conn, _params) do
    collaborators = Account.list_collaborators() |> Repo.preload([:user])
    render(conn, "index.html", collaborators: collaborators)
  end

  def new(conn, _params) do
    changeset = Account.change_collaborator(%Collaborator{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"collaborator" => collaborator_params}) do
    case Account.create_collaborator(collaborator_params) do
      {:ok, collaborator} ->
        conn
        |> put_flash(:info, "Collaborator created successfully.")
        |> redirect(to: Routes.collaborator_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    collaborator = Account.get_collaborator!(id)
    render(conn, "show.html", collaborator: collaborator)
  end

  def edit(conn, %{"id" => id}) do
    collaborator = Account.get_collaborator!(id) |> Repo.preload([:user])
    changeset = Account.change_collaborator(collaborator)
    render(conn, "edit.html", collaborator: collaborator, changeset: changeset)
  end

  def update(conn, %{"id" => id, "collaborator" => collaborator_params}) do
    collaborator = Account.get_collaborator!(id) |> Repo.preload([:user])

    case Account.update_collaborator(collaborator, collaborator_params) do
      {:ok, collaborator} ->
        conn
        |> put_flash(:info, "Collaborator updated successfully.")
        |> redirect(to: Routes.collaborator_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", collaborator: collaborator, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    collaborator = Account.get_collaborator!(id)
    {:ok, _collaborator} = Account.delete_collaborator(collaborator)

    conn
    |> put_flash(:info, "Collaborator deleted successfully.")
    |> redirect(to: Routes.collaborator_path(conn, :index))
  end
end
