defmodule Safedoc.Setting.Step do
  use Ecto.Schema
  import Ecto.Changeset

  schema "steps" do
    field :name, :string
    field :position, :integer

    timestamps()
  end

  @doc false
  def changeset(step, attrs) do
    step
    |> cast(attrs, [:name, :position])
    |> validate_required([:name, :position])
  end
end
