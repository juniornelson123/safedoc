defmodule Safedoc.Setting.Indexer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "indexers" do
    field :name, :string
    belongs_to :activity, Safedoc.Setting.Activity

    timestamps()
  end

  @doc false
  def changeset(indexer, attrs) do
    indexer
    |> cast(attrs, [:name, :activity_id])
    |> cast_assoc(:activity)
    |> validate_required([])
  end
end
