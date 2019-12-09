defmodule Safedoc.Account.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :cnpj, :string
    field :code, :string
    field :cpf, :string
    field :fantasy_name, :string
    field :kind, :string
    field :municipal_registration, :string
    field :reason_social, :string
    field :rg, :string
    field :state_registration, :string
    field :status, :string
    belongs_to :user, Safedoc.Account.User
    belongs_to :activity, Safedoc.Setting.Activity
    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:code, :kind, :status, :cpf, :rg, :state_registration, :municipal_registration, :cnpj, :reason_social, :fantasy_name, :activity_id])
    |> cast_assoc(:user)
    # |> validate_required([:code, :kind, :status, :cpf, :rg, :state_registration, :municipal_registration, :cnpj, :reason_social, :fantasy_name])
    |> unique_constraint(:cpf)
    |> unique_constraint(:cnpj)
  end

  def set_code(changeset) do

  end

  def set_status(changeset) do

  end
end
