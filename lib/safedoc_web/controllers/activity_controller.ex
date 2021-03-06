defmodule SafedocWeb.ActivityController do
  use SafedocWeb, :controller

  alias Safedoc.Setting
  alias Safedoc.Setting.Activity

  def index(conn, _params) do
    activities = Setting.list_activities()
    render(conn, "index.html", activities: activities)
  end

  def new(conn, _params) do
    changeset = Setting.change_activity(%Activity{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"activity" => activity_params}) do
    case Setting.create_activity(activity_params) do
      {:ok, activity} ->
        conn
        |> put_flash(:info, "Activity created successfully.")
        |> redirect(to: Routes.activity_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    activity = Setting.get_activity!(id)
    render(conn, "show.html", activity: activity)
  end

  def edit(conn, %{"id" => id}) do
    activity = Setting.get_activity!(id)
    changeset = Setting.change_activity(activity)
    render(conn, "edit.html", activity: activity, changeset: changeset)
  end

  def update(conn, %{"id" => id, "activity" => activity_params}) do
    activity = Setting.get_activity!(id)

    case Setting.update_activity(activity, activity_params) do
      {:ok, activity} ->
        conn
        |> put_flash(:info, "Activity updated successfully.")
        |> redirect(to: Routes.activity_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", activity: activity, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    activity = Setting.get_activity!(id)
    {:ok, _activity} = Setting.delete_activity(activity)

    conn
    |> put_flash(:info, "Activity deleted successfully.")
    |> redirect(to: Routes.activity_path(conn, :index))
  end
end
