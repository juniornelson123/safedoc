defmodule SafedocWeb.StepController do
  use SafedocWeb, :controller

  alias Safedoc.Setting
  alias Safedoc.Setting.Step

  def index(conn, _params) do
    steps = Setting.list_steps()
    render(conn, "index.html", steps: steps)
  end

  def new(conn, _params) do
    changeset = Setting.change_step(%Step{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"step" => step_params}) do
    case Setting.create_step(step_params) do
      {:ok, step} ->
        conn
        |> put_flash(:info, "Step created successfully.")
        |> redirect(to: Routes.step_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    step = Setting.get_step!(id)
    render(conn, "show.html", step: step)
  end

  def edit(conn, %{"id" => id}) do
    step = Setting.get_step!(id)
    changeset = Setting.change_step(step)
    render(conn, "edit.html", step: step, changeset: changeset)
  end

  def update(conn, %{"id" => id, "step" => step_params}) do
    step = Setting.get_step!(id)

    case Setting.update_step(step, step_params) do
      {:ok, step} ->
        conn
        |> put_flash(:info, "Step updated successfully.")
        |> redirect(to: Routes.step_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", step: step, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    step = Setting.get_step!(id)
    {:ok, _step} = Setting.delete_step(step)

    conn
    |> put_flash(:info, "Step deleted successfully.")
    |> redirect(to: Routes.step_path(conn, :index))
  end
end
