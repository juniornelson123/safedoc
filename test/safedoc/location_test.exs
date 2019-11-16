defmodule Safedoc.LocationTest do
  use Safedoc.DataCase

  alias Safedoc.Location

  describe "states" do
    alias Safedoc.Location.State

    @valid_attrs %{name: "some name", uf: "some uf"}
    @update_attrs %{name: "some updated name", uf: "some updated uf"}
    @invalid_attrs %{name: nil, uf: nil}

    def state_fixture(attrs \\ %{}) do
      {:ok, state} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Location.create_state()

      state
    end

    test "list_states/0 returns all states" do
      state = state_fixture()
      assert Location.list_states() == [state]
    end

    test "get_state!/1 returns the state with given id" do
      state = state_fixture()
      assert Location.get_state!(state.id) == state
    end

    test "create_state/1 with valid data creates a state" do
      assert {:ok, %State{} = state} = Location.create_state(@valid_attrs)
      assert state.name == "some name"
      assert state.uf == "some uf"
    end

    test "create_state/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Location.create_state(@invalid_attrs)
    end

    test "update_state/2 with valid data updates the state" do
      state = state_fixture()
      assert {:ok, %State{} = state} = Location.update_state(state, @update_attrs)
      assert state.name == "some updated name"
      assert state.uf == "some updated uf"
    end

    test "update_state/2 with invalid data returns error changeset" do
      state = state_fixture()
      assert {:error, %Ecto.Changeset{}} = Location.update_state(state, @invalid_attrs)
      assert state == Location.get_state!(state.id)
    end

    test "delete_state/1 deletes the state" do
      state = state_fixture()
      assert {:ok, %State{}} = Location.delete_state(state)
      assert_raise Ecto.NoResultsError, fn -> Location.get_state!(state.id) end
    end

    test "change_state/1 returns a state changeset" do
      state = state_fixture()
      assert %Ecto.Changeset{} = Location.change_state(state)
    end
  end

  describe "cities" do
    alias Safedoc.Location.City

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def city_fixture(attrs \\ %{}) do
      {:ok, city} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Location.create_city()

      city
    end

    test "list_cities/0 returns all cities" do
      city = city_fixture()
      assert Location.list_cities() == [city]
    end

    test "get_city!/1 returns the city with given id" do
      city = city_fixture()
      assert Location.get_city!(city.id) == city
    end

    test "create_city/1 with valid data creates a city" do
      assert {:ok, %City{} = city} = Location.create_city(@valid_attrs)
      assert city.name == "some name"
    end

    test "create_city/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Location.create_city(@invalid_attrs)
    end

    test "update_city/2 with valid data updates the city" do
      city = city_fixture()
      assert {:ok, %City{} = city} = Location.update_city(city, @update_attrs)
      assert city.name == "some updated name"
    end

    test "update_city/2 with invalid data returns error changeset" do
      city = city_fixture()
      assert {:error, %Ecto.Changeset{}} = Location.update_city(city, @invalid_attrs)
      assert city == Location.get_city!(city.id)
    end

    test "delete_city/1 deletes the city" do
      city = city_fixture()
      assert {:ok, %City{}} = Location.delete_city(city)
      assert_raise Ecto.NoResultsError, fn -> Location.get_city!(city.id) end
    end

    test "change_city/1 returns a city changeset" do
      city = city_fixture()
      assert %Ecto.Changeset{} = Location.change_city(city)
    end
  end

  describe "addresses" do
    alias Safedoc.Location.Address

    @valid_attrs %{cep: "some cep", complement: "some complement", district: "some district", number: 42, street: "some street"}
    @update_attrs %{cep: "some updated cep", complement: "some updated complement", district: "some updated district", number: 43, street: "some updated street"}
    @invalid_attrs %{cep: nil, complement: nil, district: nil, number: nil, street: nil}

    def address_fixture(attrs \\ %{}) do
      {:ok, address} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Location.create_address()

      address
    end

    test "list_addresses/0 returns all addresses" do
      address = address_fixture()
      assert Location.list_addresses() == [address]
    end

    test "get_address!/1 returns the address with given id" do
      address = address_fixture()
      assert Location.get_address!(address.id) == address
    end

    test "create_address/1 with valid data creates a address" do
      assert {:ok, %Address{} = address} = Location.create_address(@valid_attrs)
      assert address.cep == "some cep"
      assert address.complement == "some complement"
      assert address.district == "some district"
      assert address.number == 42
      assert address.street == "some street"
    end

    test "create_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Location.create_address(@invalid_attrs)
    end

    test "update_address/2 with valid data updates the address" do
      address = address_fixture()
      assert {:ok, %Address{} = address} = Location.update_address(address, @update_attrs)
      assert address.cep == "some updated cep"
      assert address.complement == "some updated complement"
      assert address.district == "some updated district"
      assert address.number == 43
      assert address.street == "some updated street"
    end

    test "update_address/2 with invalid data returns error changeset" do
      address = address_fixture()
      assert {:error, %Ecto.Changeset{}} = Location.update_address(address, @invalid_attrs)
      assert address == Location.get_address!(address.id)
    end

    test "delete_address/1 deletes the address" do
      address = address_fixture()
      assert {:ok, %Address{}} = Location.delete_address(address)
      assert_raise Ecto.NoResultsError, fn -> Location.get_address!(address.id) end
    end

    test "change_address/1 returns a address changeset" do
      address = address_fixture()
      assert %Ecto.Changeset{} = Location.change_address(address)
    end
  end
end
