defmodule Safedoc.Repo.Migrations.CreateContainers do
  use Ecto.Migration

  def change do
    create table(:containers) do
      add :code, :string
      add :description, :text
      add :container_id, references(:containers, on_delete: :nothing)

      timestamps()
    end

    create index(:containers, [:container_id])
  end
end
