defmodule Safedoc.Location.Address do
  use Ecto.Schema
  import Ecto.Changeset

  schema "addresses" do
    field :cep, :string
    field :complement, :string
    field :district, :string
    field :number, :integer
    field :street, :string
    belongs_to :customer_id, Safedoc.Account.Customer
    belongs_to :city_id, Safedoc.Location.City

    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:cep, :street, :number, :district, :complement, :customer_id, :city_id])
    |> validate_required([:cep, :street, :number, :district, :complement])
  end
end
