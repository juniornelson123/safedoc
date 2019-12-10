defmodule Safedoc.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :amount, :integer
      add :prefix, :string
      add :sufix, :string
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

  end
end
