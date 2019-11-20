defmodule Safedoc.Account do
  @moduledoc """
  The Account context.
  """

  import Ecto.Query, warn: false
  alias Safedoc.Repo

  alias Safedoc.Account.User

  alias Argon2

  def authenticate_user(email, plain_text_password) do
    query = from u in User, where: u.email == ^email
    case Repo.one(query) do
      nil ->
        Argon2.no_user_verify()
        {:error, :invalid_credentials}
      user ->
        if Argon2.verify_pass(plain_text_password, user.password) do
          {:ok, user}
        else
          {:error, :invalid_credentials}
        end
    end
  end

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Safedoc.Account.Customer

  @doc """
  Returns the list of customers.

  ## Examples

      iex> list_customers()
      [%Customer{}, ...]

  """
  def list_customers(size) do
    query = from c in Customer, limit: ^size, order_by: [desc: c.inserted_at]
    Repo.all(query)
  end

  def list_customers, do: Repo.all(Customer)

  @doc """
  Gets a single customer.

  Raises `Ecto.NoResultsError` if the Customer does not exist.

  ## Examples

      iex> get_customer!(123)
      %Customer{}

      iex> get_customer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_customer!(id) do
    Repo.get!(Customer, id)
  end

  @doc """
  Creates a customer.

  ## Examples

      iex> create_customer(%{field: value})
      {:ok, %Customer{}}

      iex> create_customer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_customer(attrs \\ %{}) do
    %Customer{}
    |> Customer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a customer.

  ## Examples

      iex> update_customer(customer, %{field: new_value})
      {:ok, %Customer{}}

      iex> update_customer(customer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_customer(%Customer{} = customer, attrs) do
    customer
    |> Customer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Customer.

  ## Examples

      iex> delete_customer(customer)
      {:ok, %Customer{}}

      iex> delete_customer(customer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_customer(%Customer{} = customer) do
    Repo.delete(customer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking customer changes.

  ## Examples

      iex> change_customer(customer)
      %Ecto.Changeset{source: %Customer{}}

  """
  def change_customer(%Customer{} = customer) do
    Customer.changeset(customer, %{})
  end

  alias Safedoc.Account.Phone

  @doc """
  Returns the list of phones.

  ## Examples

      iex> list_phones()
      [%Phone{}, ...]

  """
  def list_phones do
    Repo.all(Phone)
  end

  @doc """
  Gets a single phone.

  Raises `Ecto.NoResultsError` if the Phone does not exist.

  ## Examples

      iex> get_phone!(123)
      %Phone{}

      iex> get_phone!(456)
      ** (Ecto.NoResultsError)

  """
  def get_phone!(id), do: Repo.get!(Phone, id)

  @doc """
  Creates a phone.

  ## Examples

      iex> create_phone(%{field: value})
      {:ok, %Phone{}}

      iex> create_phone(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_phone(attrs \\ %{}) do
    %Phone{}
    |> Phone.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a phone.

  ## Examples

      iex> update_phone(phone, %{field: new_value})
      {:ok, %Phone{}}

      iex> update_phone(phone, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_phone(%Phone{} = phone, attrs) do
    phone
    |> Phone.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Phone.

  ## Examples

      iex> delete_phone(phone)
      {:ok, %Phone{}}

      iex> delete_phone(phone)
      {:error, %Ecto.Changeset{}}

  """
  def delete_phone(%Phone{} = phone) do
    Repo.delete(phone)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking phone changes.

  ## Examples

      iex> change_phone(phone)
      %Ecto.Changeset{source: %Phone{}}

  """
  def change_phone(%Phone{} = phone) do
    Phone.changeset(phone, %{})
  end

  alias Safedoc.Account.Collaborator

  @doc """
  Returns the list of collaborators.

  ## Examples

      iex> list_collaborators()
      [%Collaborator{}, ...]

  """
  def list_collaborators do
    Repo.all(Collaborator)
  end

  @doc """
  Gets a single collaborator.

  Raises `Ecto.NoResultsError` if the Collaborator does not exist.

  ## Examples

      iex> get_collaborator!(123)
      %Collaborator{}

      iex> get_collaborator!(456)
      ** (Ecto.NoResultsError)

  """
  def get_collaborator!(id), do: Repo.get!(Collaborator, id)

  @doc """
  Creates a collaborator.

  ## Examples

      iex> create_collaborator(%{field: value})
      {:ok, %Collaborator{}}

      iex> create_collaborator(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_collaborator(attrs \\ %{}) do
    %Collaborator{}
    |> Collaborator.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a collaborator.

  ## Examples

      iex> update_collaborator(collaborator, %{field: new_value})
      {:ok, %Collaborator{}}

      iex> update_collaborator(collaborator, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_collaborator(%Collaborator{} = collaborator, attrs) do
    collaborator
    |> Collaborator.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Collaborator.

  ## Examples

      iex> delete_collaborator(collaborator)
      {:ok, %Collaborator{}}

      iex> delete_collaborator(collaborator)
      {:error, %Ecto.Changeset{}}

  """
  def delete_collaborator(%Collaborator{} = collaborator) do
    Repo.delete(collaborator)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking collaborator changes.

  ## Examples

      iex> change_collaborator(collaborator)
      %Ecto.Changeset{source: %Collaborator{}}

  """
  def change_collaborator(%Collaborator{} = collaborator) do
    Collaborator.changeset(collaborator, %{})
  end
end
