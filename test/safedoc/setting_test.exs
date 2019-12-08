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

  describe "activities" do
    alias Safedoc.Setting.Activity

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def activity_fixture(attrs \\ %{}) do
      {:ok, activity} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Setting.create_activity()

      activity
    end

    test "list_activities/0 returns all activities" do
      activity = activity_fixture()
      assert Setting.list_activities() == [activity]
    end

    test "get_activity!/1 returns the activity with given id" do
      activity = activity_fixture()
      assert Setting.get_activity!(activity.id) == activity
    end

    test "create_activity/1 with valid data creates a activity" do
      assert {:ok, %Activity{} = activity} = Setting.create_activity(@valid_attrs)
      assert activity.name == "some name"
    end

    test "create_activity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Setting.create_activity(@invalid_attrs)
    end

    test "update_activity/2 with valid data updates the activity" do
      activity = activity_fixture()
      assert {:ok, %Activity{} = activity} = Setting.update_activity(activity, @update_attrs)
      assert activity.name == "some updated name"
    end

    test "update_activity/2 with invalid data returns error changeset" do
      activity = activity_fixture()
      assert {:error, %Ecto.Changeset{}} = Setting.update_activity(activity, @invalid_attrs)
      assert activity == Setting.get_activity!(activity.id)
    end

    test "delete_activity/1 deletes the activity" do
      activity = activity_fixture()
      assert {:ok, %Activity{}} = Setting.delete_activity(activity)
      assert_raise Ecto.NoResultsError, fn -> Setting.get_activity!(activity.id) end
    end

    test "change_activity/1 returns a activity changeset" do
      activity = activity_fixture()
      assert %Ecto.Changeset{} = Setting.change_activity(activity)
    end
  end

  describe "name" do
    alias Safedoc.Setting.Indexer

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def indexer_fixture(attrs \\ %{}) do
      {:ok, indexer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Setting.create_indexer()

      indexer
    end

    test "list_name/0 returns all name" do
      indexer = indexer_fixture()
      assert Setting.list_name() == [indexer]
    end

    test "get_indexer!/1 returns the indexer with given id" do
      indexer = indexer_fixture()
      assert Setting.get_indexer!(indexer.id) == indexer
    end

    test "create_indexer/1 with valid data creates a indexer" do
      assert {:ok, %Indexer{} = indexer} = Setting.create_indexer(@valid_attrs)
    end

    test "create_indexer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Setting.create_indexer(@invalid_attrs)
    end

    test "update_indexer/2 with valid data updates the indexer" do
      indexer = indexer_fixture()
      assert {:ok, %Indexer{} = indexer} = Setting.update_indexer(indexer, @update_attrs)
    end

    test "update_indexer/2 with invalid data returns error changeset" do
      indexer = indexer_fixture()
      assert {:error, %Ecto.Changeset{}} = Setting.update_indexer(indexer, @invalid_attrs)
      assert indexer == Setting.get_indexer!(indexer.id)
    end

    test "delete_indexer/1 deletes the indexer" do
      indexer = indexer_fixture()
      assert {:ok, %Indexer{}} = Setting.delete_indexer(indexer)
      assert_raise Ecto.NoResultsError, fn -> Setting.get_indexer!(indexer.id) end
    end

    test "change_indexer/1 returns a indexer changeset" do
      indexer = indexer_fixture()
      assert %Ecto.Changeset{} = Setting.change_indexer(indexer)
    end
  end

  describe "name" do
    alias Safedoc.Setting.IndexerData

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def indexer_data_fixture(attrs \\ %{}) do
      {:ok, indexer_data} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Setting.create_indexer_data()

      indexer_data
    end

    test "list_name/0 returns all name" do
      indexer_data = indexer_data_fixture()
      assert Setting.list_name() == [indexer_data]
    end

    test "get_indexer_data!/1 returns the indexer_data with given id" do
      indexer_data = indexer_data_fixture()
      assert Setting.get_indexer_data!(indexer_data.id) == indexer_data
    end

    test "create_indexer_data/1 with valid data creates a indexer_data" do
      assert {:ok, %IndexerData{} = indexer_data} = Setting.create_indexer_data(@valid_attrs)
    end

    test "create_indexer_data/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Setting.create_indexer_data(@invalid_attrs)
    end

    test "update_indexer_data/2 with valid data updates the indexer_data" do
      indexer_data = indexer_data_fixture()
      assert {:ok, %IndexerData{} = indexer_data} = Setting.update_indexer_data(indexer_data, @update_attrs)
    end

    test "update_indexer_data/2 with invalid data returns error changeset" do
      indexer_data = indexer_data_fixture()
      assert {:error, %Ecto.Changeset{}} = Setting.update_indexer_data(indexer_data, @invalid_attrs)
      assert indexer_data == Setting.get_indexer_data!(indexer_data.id)
    end

    test "delete_indexer_data/1 deletes the indexer_data" do
      indexer_data = indexer_data_fixture()
      assert {:ok, %IndexerData{}} = Setting.delete_indexer_data(indexer_data)
      assert_raise Ecto.NoResultsError, fn -> Setting.get_indexer_data!(indexer_data.id) end
    end

    test "change_indexer_data/1 returns a indexer_data changeset" do
      indexer_data = indexer_data_fixture()
      assert %Ecto.Changeset{} = Setting.change_indexer_data(indexer_data)
    end
  end

  describe "containers_services" do
    alias Safedoc.Setting.ContainersService

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def containers_service_fixture(attrs \\ %{}) do
      {:ok, containers_service} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Setting.create_containers_service()

      containers_service
    end

    test "list_containers_services/0 returns all containers_services" do
      containers_service = containers_service_fixture()
      assert Setting.list_containers_services() == [containers_service]
    end

    test "get_containers_service!/1 returns the containers_service with given id" do
      containers_service = containers_service_fixture()
      assert Setting.get_containers_service!(containers_service.id) == containers_service
    end

    test "create_containers_service/1 with valid data creates a containers_service" do
      assert {:ok, %ContainersService{} = containers_service} = Setting.create_containers_service(@valid_attrs)
    end

    test "create_containers_service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Setting.create_containers_service(@invalid_attrs)
    end

    test "update_containers_service/2 with valid data updates the containers_service" do
      containers_service = containers_service_fixture()
      assert {:ok, %ContainersService{} = containers_service} = Setting.update_containers_service(containers_service, @update_attrs)
    end

    test "update_containers_service/2 with invalid data returns error changeset" do
      containers_service = containers_service_fixture()
      assert {:error, %Ecto.Changeset{}} = Setting.update_containers_service(containers_service, @invalid_attrs)
      assert containers_service == Setting.get_containers_service!(containers_service.id)
    end

    test "delete_containers_service/1 deletes the containers_service" do
      containers_service = containers_service_fixture()
      assert {:ok, %ContainersService{}} = Setting.delete_containers_service(containers_service)
      assert_raise Ecto.NoResultsError, fn -> Setting.get_containers_service!(containers_service.id) end
    end

    test "change_containers_service/1 returns a containers_service changeset" do
      containers_service = containers_service_fixture()
      assert %Ecto.Changeset{} = Setting.change_containers_service(containers_service)
    end
  end
end
