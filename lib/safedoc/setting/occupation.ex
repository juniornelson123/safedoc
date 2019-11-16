defmodule Safedoc.Setting.Occupation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "occupations" do
    field :date_end, :naive_datetime
    field :date_start, :naive_datetime
    field :status, :string
    field :step_id, :id
    field :collaborator_id, :id

    timestamps()
  end

  @doc false
  def changeset(occupation, attrs) do
    occupation
    |> cast(attrs, [:status, :date_start, :date_end])
    |> validate_required([:status, :date_start, :date_end])
  end
end
