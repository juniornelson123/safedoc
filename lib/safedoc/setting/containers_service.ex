defmodule Safedoc.Setting.ContainersService do
  use Ecto.Schema
  import Ecto.Changeset

  schema "containers_services" do
    belongs_to :service, Safedoc.Archive.Service
    belongs_to :container, Safedoc.Archive.Container

    timestamps()
  end

  @doc false
  def changeset(containers_service, attrs) do
    containers_service
    |> cast(attrs, [:service_id, :container_id])
    |> validate_required([])
  end
end
