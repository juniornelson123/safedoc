defmodule Safedoc.Repo.Migrations.CreateSteps do
  use Ecto.Migration

  def change do
    create table(:steps) do
      add :name, :string
      add :position, :integer

      timestamps()
    end

  end
end
