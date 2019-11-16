defmodule Safedoc.Archive.Document do
  use Ecto.Schema
  import Ecto.Changeset

  schema "documents" do
    field :code, :string
    field :customer_id, :string
    field :status, :string
    field :container_id, :id

    timestamps()
  end

  @doc false
  def changeset(document, attrs) do
    document
    |> cast(attrs, [:code, :customer_id, :status])
    |> validate_required([:code, :customer_id, :status])
  end
end
