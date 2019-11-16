defmodule Safedoc.Repo.Migrations.CreatePhones do
  use Ecto.Migration

  def change do
    create table(:phones) do
      add :number, :string
      add :customer_id, references(:customers, on_delete: :nothing)

      timestamps()
    end

    create index(:phones, [:customer_id])
  end
end
