defmodule Safedoc.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :amount, :integer

      timestamps()
    end

  end
end
