defmodule Safedoc.Account.Phone do
  use Ecto.Schema
  import Ecto.Changeset

  schema "phones" do
    field :number, :string
    field :customer_id, :id

    timestamps()
  end

  @doc false
  def changeset(phone, attrs) do
    phone
    |> cast(attrs, [:number])
    |> validate_required([:number])
  end
end
