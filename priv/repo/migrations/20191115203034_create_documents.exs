defmodule Safedoc.Repo.Migrations.CreateDocuments do
  use Ecto.Migration

  def change do
    create table(:documents) do
      add :code, :string
      add :customer_id, :text
      add :status, :string
      add :container_id, references(:containers, on_delete: :nothing)

      timestamps()
    end

    create index(:documents, [:container_id])
  end
end
