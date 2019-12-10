defmodule Safedoc.Account.Collaborator do
  use Ecto.Schema
  import Ecto.Changeset

  schema "collaborators" do
    field :office, :string
    field :status, :string
    belongs_to :user, Safedoc.Account.User
    has_many :occupations, Safedoc.Setting.Occupation
    timestamps()
  end

  @doc false
  def changeset(collaborator, attrs) do
    collaborator
    |> cast(attrs, [:office, :status])
    |> cast_assoc(:user)
    |> validate_required([])
  end
end
