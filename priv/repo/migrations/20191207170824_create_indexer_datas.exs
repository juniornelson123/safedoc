defmodule Safedoc.Repo.Migrations.CreateIndexerDatas do
  use Ecto.Migration

  def change do
    create table(:indexer_datas) do
      add :name, :string
      add :document_id, references(:documents, on_delete: :nothing)
      add :indexer_id, references(:indexers, on_delete: :nothing)

      timestamps()
    end

    create index(:indexer_datas, [:document_id])
    create index(:indexer_datas, [:indexer_id])
  end
end
