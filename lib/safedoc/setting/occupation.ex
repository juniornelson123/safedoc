defmodule Safedoc.Setting.Occupation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "occupations" do
    field :date_end, :naive_datetime
    field :date_start, :naive_datetime
    field :status, :string
    belongs_to :step, Safedoc.Setting.Step
    belongs_to :collaborator, Safedoc.Account.Collaborator

    timestamps()
  end

  @doc false
  def changeset(occupation, attrs) do
    occupation
    |> cast(attrs, [:status, :date_start, :date_end, :step_id, :collaborator_id])
    |> validate_required([:step_id, :date_start, :collaborator_id])
  end
end
