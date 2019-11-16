defmodule Safedoc.AccountTest do
  use Safedoc.DataCase

  alias Safedoc.Account

  describe "users" do
    alias Safedoc.Account.User

    @valid_attrs %{email: "some email", name: "some name", password: "some password"}
    @update_attrs %{email: "some updated email", name: "some updated name", password: "some updated password"}
    @invalid_attrs %{email: nil, name: nil, password: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Account.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
      assert user.password == "some password"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Account.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.name == "some updated name"
      assert user.password == "some updated password"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end

  describe "customers" do
    alias Safedoc.Account.Customer

    @valid_attrs %{cnpj: "some cnpj", code: "some code", cpf: "some cpf", fantasy_name: "some fantasy_name", kind: "some kind", municipal_registration: "some municipal_registration", reason_social: "some reason_social", rg: "some rg", state_registration: "some state_registration", status: "some status"}
    @update_attrs %{cnpj: "some updated cnpj", code: "some updated code", cpf: "some updated cpf", fantasy_name: "some updated fantasy_name", kind: "some updated kind", municipal_registration: "some updated municipal_registration", reason_social: "some updated reason_social", rg: "some updated rg", state_registration: "some updated state_registration", status: "some updated status"}
    @invalid_attrs %{cnpj: nil, code: nil, cpf: nil, fantasy_name: nil, kind: nil, municipal_registration: nil, reason_social: nil, rg: nil, state_registration: nil, status: nil}

    def customer_fixture(attrs \\ %{}) do
      {:ok, customer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_customer()

      customer
    end

    test "list_customers/0 returns all customers" do
      customer = customer_fixture()
      assert Account.list_customers() == [customer]
    end

    test "get_customer!/1 returns the customer with given id" do
      customer = customer_fixture()
      assert Account.get_customer!(customer.id) == customer
    end

    test "create_customer/1 with valid data creates a customer" do
      assert {:ok, %Customer{} = customer} = Account.create_customer(@valid_attrs)
      assert customer.cnpj == "some cnpj"
      assert customer.code == "some code"
      assert customer.cpf == "some cpf"
      assert customer.fantasy_name == "some fantasy_name"
      assert customer.kind == "some kind"
      assert customer.municipal_registration == "some municipal_registration"
      assert customer.reason_social == "some reason_social"
      assert customer.rg == "some rg"
      assert customer.state_registration == "some state_registration"
      assert customer.status == "some status"
    end

    test "create_customer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_customer(@invalid_attrs)
    end

    test "update_customer/2 with valid data updates the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{} = customer} = Account.update_customer(customer, @update_attrs)
      assert customer.cnpj == "some updated cnpj"
      assert customer.code == "some updated code"
      assert customer.cpf == "some updated cpf"
      assert customer.fantasy_name == "some updated fantasy_name"
      assert customer.kind == "some updated kind"
      assert customer.municipal_registration == "some updated municipal_registration"
      assert customer.reason_social == "some updated reason_social"
      assert customer.rg == "some updated rg"
      assert customer.state_registration == "some updated state_registration"
      assert customer.status == "some updated status"
    end

    test "update_customer/2 with invalid data returns error changeset" do
      customer = customer_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_customer(customer, @invalid_attrs)
      assert customer == Account.get_customer!(customer.id)
    end

    test "delete_customer/1 deletes the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{}} = Account.delete_customer(customer)
      assert_raise Ecto.NoResultsError, fn -> Account.get_customer!(customer.id) end
    end

    test "change_customer/1 returns a customer changeset" do
      customer = customer_fixture()
      assert %Ecto.Changeset{} = Account.change_customer(customer)
    end
  end

  describe "phones" do
    alias Safedoc.Account.Phone

    @valid_attrs %{number: "some number"}
    @update_attrs %{number: "some updated number"}
    @invalid_attrs %{number: nil}

    def phone_fixture(attrs \\ %{}) do
      {:ok, phone} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_phone()

      phone
    end

    test "list_phones/0 returns all phones" do
      phone = phone_fixture()
      assert Account.list_phones() == [phone]
    end

    test "get_phone!/1 returns the phone with given id" do
      phone = phone_fixture()
      assert Account.get_phone!(phone.id) == phone
    end

    test "create_phone/1 with valid data creates a phone" do
      assert {:ok, %Phone{} = phone} = Account.create_phone(@valid_attrs)
      assert phone.number == "some number"
    end

    test "create_phone/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_phone(@invalid_attrs)
    end

    test "update_phone/2 with valid data updates the phone" do
      phone = phone_fixture()
      assert {:ok, %Phone{} = phone} = Account.update_phone(phone, @update_attrs)
      assert phone.number == "some updated number"
    end

    test "update_phone/2 with invalid data returns error changeset" do
      phone = phone_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_phone(phone, @invalid_attrs)
      assert phone == Account.get_phone!(phone.id)
    end

    test "delete_phone/1 deletes the phone" do
      phone = phone_fixture()
      assert {:ok, %Phone{}} = Account.delete_phone(phone)
      assert_raise Ecto.NoResultsError, fn -> Account.get_phone!(phone.id) end
    end

    test "change_phone/1 returns a phone changeset" do
      phone = phone_fixture()
      assert %Ecto.Changeset{} = Account.change_phone(phone)
    end
  end

  describe "collaborators" do
    alias Safedoc.Account.Collaborator

    @valid_attrs %{office: "some office", status: "some status"}
    @update_attrs %{office: "some updated office", status: "some updated status"}
    @invalid_attrs %{office: nil, status: nil}

    def collaborator_fixture(attrs \\ %{}) do
      {:ok, collaborator} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_collaborator()

      collaborator
    end

    test "list_collaborators/0 returns all collaborators" do
      collaborator = collaborator_fixture()
      assert Account.list_collaborators() == [collaborator]
    end

    test "get_collaborator!/1 returns the collaborator with given id" do
      collaborator = collaborator_fixture()
      assert Account.get_collaborator!(collaborator.id) == collaborator
    end

    test "create_collaborator/1 with valid data creates a collaborator" do
      assert {:ok, %Collaborator{} = collaborator} = Account.create_collaborator(@valid_attrs)
      assert collaborator.office == "some office"
      assert collaborator.status == "some status"
    end

    test "create_collaborator/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_collaborator(@invalid_attrs)
    end

    test "update_collaborator/2 with valid data updates the collaborator" do
      collaborator = collaborator_fixture()
      assert {:ok, %Collaborator{} = collaborator} = Account.update_collaborator(collaborator, @update_attrs)
      assert collaborator.office == "some updated office"
      assert collaborator.status == "some updated status"
    end

    test "update_collaborator/2 with invalid data returns error changeset" do
      collaborator = collaborator_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_collaborator(collaborator, @invalid_attrs)
      assert collaborator == Account.get_collaborator!(collaborator.id)
    end

    test "delete_collaborator/1 deletes the collaborator" do
      collaborator = collaborator_fixture()
      assert {:ok, %Collaborator{}} = Account.delete_collaborator(collaborator)
      assert_raise Ecto.NoResultsError, fn -> Account.get_collaborator!(collaborator.id) end
    end

    test "change_collaborator/1 returns a collaborator changeset" do
      collaborator = collaborator_fixture()
      assert %Ecto.Changeset{} = Account.change_collaborator(collaborator)
    end
  end
end
