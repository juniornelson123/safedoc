defmodule Safedoc.Repo.Migrations.CreateIndexers do
  use Ecto.Migration

  def change do
    create table(:indexers) do
      add :name, :string
      add :activity_id, references(:activities, on_delete: :nothing)

      timestamps()
    end

    create index(:indexers, [:activity_id])
  end
end
