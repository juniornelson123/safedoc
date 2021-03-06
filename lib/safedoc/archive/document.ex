defmodule Safedoc.Archive.Document do
  use Ecto.Schema
  import Ecto.Changeset

  schema "documents" do
    field :code, :string
    field :status, :string
    belongs_to :customer, Safedoc.Archive.Customer
    belongs_to :container, Safedoc.Archive.Container
    has_many :indexers_data, Safedoc.Setting.IndexerData

    timestamps()
  end

  @doc false
  def changeset(document, attrs) do
    document
    |> cast(attrs, [:code, :container_id, :customer_id, :status])
    |> validate_required([:code])
  end
end
