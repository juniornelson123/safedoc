defmodule Safedoc.Account.Collaborator do
  use Ecto.Schema
  import Ecto.Changeset

  schema "collaborators" do
    field :office, :string
    field :status, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(collaborator, attrs) do
    collaborator
    |> cast(attrs, [:office, :status])
    |> validate_required([:office, :status])
  end
end
