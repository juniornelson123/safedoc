defmodule Safedoc.Setting.IndexerData do
  use Ecto.Schema
  import Ecto.Changeset

  schema "indexer_datas" do
    field :name, :string
    belongs_to :document_id, Safedoc.Archive.Document
    belongs_to :indexer_id, Safedoc.Setting.Indexer

    timestamps()
  end

  @doc false
  def changeset(indexer_data, attrs) do
    indexer_data
    |> cast(attrs, [:name, :document_id, :indexer_id])
    |> validate_required([])
  end
end
