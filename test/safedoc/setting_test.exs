defmodule Safedoc.SettingTest do
  use Safedoc.DataCase

  alias Safedoc.Setting

  describe "steps" do
    alias Safedoc.Setting.Step

    @valid_attrs %{name: "some name", position: 42}
    @update_attrs %{name: "some updated name", position: 43}
    @invalid_attrs %{name: nil, position: nil}

    def step_fixture(attrs \\ %{}) do
      {:ok, step} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Setting.create_step()

      step
    end

    test "list_steps/0 returns all steps" do
      step = step_fixture()
      assert Setting.list_steps() == [step]
    end

    test "get_step!/1 returns the step with given id" do
      step = step_fixture()
      assert Setting.get_step!(step.id) == step
    end

    test "create_step/1 with valid data creates a step" do
      assert {:ok, %Step{} = step} = Setting.create_step(@valid_attrs)
      assert step.name == "some name"
      assert step.position == 42
    end

    test "create_step/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Setting.create_step(@invalid_attrs)
    end

    test "update_step/2 with valid data updates the step" do
      step = step_fixture()
      assert {:ok, %Step{} = step} = Setting.update_step(step, @update_attrs)
      assert step.name == "some updated name"
      assert step.position == 43
    end

    test "update_step/2 with invalid data returns error changeset" do
      step = step_fixture()
      assert {:error, %Ecto.Changeset{}} = Setting.update_step(step, @invalid_attrs)
      assert step == Setting.get_step!(step.id)
    end

    test "delete_step/1 deletes the step" do
      step = step_fixture()
      assert {:ok, %Step{}} = Setting.delete_step(step)
      assert_raise Ecto.NoResultsError, fn -> Setting.get_step!(step.id) end
    end

    test "change_step/1 returns a step changeset" do
      step = step_fixture()
      assert %Ecto.Changeset{} = Setting.change_step(step)
    end
  end

  describe "occupations" do
    alias Safedoc.Setting.Occupation

    @valid_attrs %{date_end: ~N[2010-04-17 14:00:00], date_start: ~N[2010-04-17 14:00:00], status: "some status"}
    @update_attrs %{date_end: ~N[2011-05-18 15:01:01], date_start: ~N[2011-05-18 15:01:01], status: "some updated status"}
    @invalid_attrs %{date_end: nil, date_start: nil, status: nil}

    def occupation_fixture(attrs \\ %{}) do
      {:ok, occupation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Setting.create_occupation()

      occupation
    end

    test "list_occupations/0 returns all occupations" do
      occupation = occupation_fixture()
      assert Setting.list_occupations() == [occupation]
    end

    test "get_occupation!/1 returns the occupation with given id" do
      occupation = occupation_fixture()
      assert Setting.get_occupation!(occupation.id) == occupation
    end

    test "create_occupation/1 with valid data creates a occupation" do
      assert {:ok, %Occupation{} = occupation} = Setting.create_occupation(@valid_attrs)
      assert occupation.date_end == ~N[2010-04-17 14:00:00]
      assert occupation.date_start == ~N[2010-04-17 14:00:00]
      assert occupation.status == "some status"
    end

    test "create_occupation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Setting.create_occupation(@invalid_attrs)
    end

    test "update_occupation/2 with valid data updates the occupation" do
      occupation = occupation_fixture()
      assert {:ok, %Occupation{} = occupation} = Setting.update_occupation(occupation, @update_attrs)
      assert occupation.date_end == ~N[2011-05-18 15:01:01]
      assert occupation.date_start == ~N[2011-05-18 15:01:01]
      assert occupation.status == "some updated status"
    end

    test "update_occupation/2 with invalid data returns error changeset" do
      occupation = occupation_fixture()
      assert {:error, %Ecto.Changeset{}} = Setting.update_occupation(occupation, @invalid_attrs)
      assert occupation == Setting.get_occupation!(occupation.id)
    end

    test "delete_occupation/1 deletes the occupation" do
      occupation = occupation_fixture()
      assert {:ok, %Occupation{}} = Setting.delete_occupation(occupation)
      assert_raise Ecto.NoResultsError, fn -> Setting.get_occupation!(occupation.id) end
    end

    test "change_occupation/1 returns a occupation changeset" do
      occupation = occupation_fixture()
      assert %Ecto.Changeset{} = Setting.change_occupation(occupation)
    end
  end
end
