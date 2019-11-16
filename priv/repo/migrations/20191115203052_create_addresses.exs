defmodule Safedoc.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :cep, :string
      add :street, :string
      add :number, :integer
      add :district, :string
      add :complement, :string
      add :customer_id, references(:customers, on_delete: :nothing)
      add :city_id, references(:cities, on_delete: :nothing)

      timestamps()
    end

    create index(:addresses, [:customer_id])
    create index(:addresses, [:city_id])
  end
end
