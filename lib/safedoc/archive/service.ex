defmodule Safedoc.Archive.Service do
  use Ecto.Schema
  import Ecto.Changeset

  schema "services" do
    field :status, :string
    field :date, :utc_datetime
    belongs_to :step, Safedoc.Setting.Step
    belongs_to :collaborator, Safedoc.Archive.Collaborator

    timestamps()
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:status, :date, :step_id, :collaborator_id])
    |> validate_required([:status])
  end
end
