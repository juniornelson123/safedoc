defmodule Safedoc.Repo.Migrations.CreateServices do
  use Ecto.Migration

  def change do
    create table(:services) do
      add :status, :string
      add :document_id, references(:documents, on_delete: :nothing)
      add :step_id, references(:steps, on_delete: :nothing)
      add :collaborator_id, references(:collaborators, on_delete: :nothing)

      timestamps()
    end

    create index(:services, [:document_id])
    create index(:services, [:step_id])
    create index(:services, [:collaborator_id])
  end
end
