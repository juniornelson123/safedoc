defmodule Safedoc.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :code, :string
      add :kind, :string
      add :status, :string
      add :cpf, :string
      add :rg, :string
      add :state_registration, :string
      add :municipal_registration, :string
      add :cnpj, :string
      add :reason_social, :string
      add :fantasy_name, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :activity_id, references(:activities, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:customers, [:cpf])
    create unique_index(:customers, [:cnpj])
    create index(:customers, [:user_id])
  end
end
