defmodule Safedoc.Archive.Container do
  use Ecto.Schema
  import Ecto.Changeset

  schema "containers" do
    field :code, :string
    field :description, :string
    field :container_id, :id

    timestamps()
  end

  @doc false
  def changeset(container, attrs) do
    container
    |> cast(attrs, [:code, :description])
    |> validate_required([:code, :description])
  end
end
