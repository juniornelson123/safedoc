defmodule Safedoc.Setting.Activity do
  use Ecto.Schema
  import Ecto.Changeset

  schema "activities" do
    field :name, :string

    has_many :indexers, Safedoc.Setting.Indexer

    timestamps()
  end

  @doc false
  def changeset(activity, attrs) do
    activity
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
