defmodule Safedoc.Repo.Migrations.CreateServices do
  use Ecto.Migration

  def change do
    create table(:services) do
      add :status, :string
      add :date, :utc_datetime
      add :step_id, references(:steps, on_delete: :nothing)
      add :collaborator_id, references(:collaborators, on_delete: :nothing)

      timestamps()
    end

    create index(:services, [:step_id])
    create index(:services, [:collaborator_id])
  end
end
