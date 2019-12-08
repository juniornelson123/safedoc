defmodule Safedoc.Repo.Migrations.CreateContainersServices do
  use Ecto.Migration

  def change do
    create table(:containers_services) do
      add :service_id, references(:services, on_delete: :nothing)
      add :container_id, references(:containers, on_delete: :nothing)

      timestamps()
    end

    create index(:containers_services, [:service_id])
    create index(:containers_services, [:container_id])
  end
end
