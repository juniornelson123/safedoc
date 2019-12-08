defmodule Safedoc.Archive.Container do
  use Ecto.Schema
  import Ecto.Changeset

  schema "containers" do
    field :code, :string
    field :description, :string
    belongs_to :category, Safedoc.Archive.Category
    belongs_to :container, Safedoc.Archive.Container
    has_many :containers, Safedoc.Archive.Container
    has_many :documents, Safedoc.Archive.Document

    timestamps()
  end

  @doc false
  def changeset(container, attrs) do
    container
    |> cast(attrs, [:code, :description, :container_id, :category_id])
    |> validate_required([])
  end
end
