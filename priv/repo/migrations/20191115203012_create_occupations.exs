defmodule Safedoc.Repo.Migrations.CreateOccupations do
  use Ecto.Migration

  def change do
    create table(:occupations) do
      add :status, :string
      add :date_start, :naive_datetime
      add :date_end, :naive_datetime
      add :step_id, references(:steps, on_delete: :nothing)
      add :collaborator_id, references(:collaborators, on_delete: :nothing)

      timestamps()
    end

    create index(:occupations, [:step_id])
    create index(:occupations, [:collaborator_id])
  end
end
