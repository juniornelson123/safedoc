defmodule Safedoc.Location.Address do
  use Ecto.Schema
  import Ecto.Changeset

  schema "addresses" do
    field :cep, :string
    field :complement, :string
    field :district, :string
    field :number, :integer
    field :street, :string
    field :customer_id, :id
    field :city_id, :id

    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:cep, :street, :number, :district, :complement])
    |> validate_required([:cep, :street, :number, :district, :complement])
  end
end
