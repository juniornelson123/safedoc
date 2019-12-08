defmodule Safedoc.Location.City do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cities" do
    field :name, :string
    belongs_to :state, Safedoc.Location.State

    timestamps()
  end

  @doc false
  def changeset(city, attrs) do
    city
    |> cast(attrs, [:name, :state_id])
    |> validate_required([:name])
  end
end
