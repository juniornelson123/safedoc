defmodule Safedoc.Archive.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :amount, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :amount])
    |> validate_required([:name, :amount])
  end
end
