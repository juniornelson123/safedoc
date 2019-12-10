defmodule Safedoc.Archive.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :amount, :integer
    field :name, :string
    field :prefix, :string
    field :sufix, :string
    belongs_to :category, Safedoc.Archive.Category

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :amount, :sufix, :prefix, :category_id])
    |> validate_required([:name, :amount])
  end
end
