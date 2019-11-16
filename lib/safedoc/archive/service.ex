defmodule Safedoc.Archive.Service do
  use Ecto.Schema
  import Ecto.Changeset

  schema "services" do
    field :status, :string
    field :document_id, :id
    field :step_id, :id
    field :collaborator_id, :id

    timestamps()
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:status])
    |> validate_required([:status])
  end
end
