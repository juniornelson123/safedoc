defmodule Safedoc.ArchiveTest do
  use Safedoc.DataCase

  alias Safedoc.Archive

  describe "categories" do
    alias Safedoc.Archive.Category

    @valid_attrs %{amount: 42, name: "some name"}
    @update_attrs %{amount: 43, name: "some updated name"}
    @invalid_attrs %{amount: nil, name: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Archive.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Archive.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Archive.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Archive.create_category(@valid_attrs)
      assert category.amount == 42
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Archive.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, %Category{} = category} = Archive.update_category(category, @update_attrs)
      assert category.amount == 43
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Archive.update_category(category, @invalid_attrs)
      assert category == Archive.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Archive.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Archive.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Archive.change_category(category)
    end
  end

  describe "containers" do
    alias Safedoc.Archive.Container

    @valid_attrs %{code: "some code", description: "some description"}
    @update_attrs %{code: "some updated code", description: "some updated description"}
    @invalid_attrs %{code: nil, description: nil}

    def container_fixture(attrs \\ %{}) do
      {:ok, container} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Archive.create_container()

      container
    end

    test "list_containers/0 returns all containers" do
      container = container_fixture()
      assert Archive.list_containers() == [container]
    end

    test "get_container!/1 returns the container with given id" do
      container = container_fixture()
      assert Archive.get_container!(container.id) == container
    end

    test "create_container/1 with valid data creates a container" do
      assert {:ok, %Container{} = container} = Archive.create_container(@valid_attrs)
      assert container.code == "some code"
      assert container.description == "some description"
    end

    test "create_container/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Archive.create_container(@invalid_attrs)
    end

    test "update_container/2 with valid data updates the container" do
      container = container_fixture()
      assert {:ok, %Container{} = container} = Archive.update_container(container, @update_attrs)
      assert container.code == "some updated code"
      assert container.description == "some updated description"
    end

    test "update_container/2 with invalid data returns error changeset" do
      container = container_fixture()
      assert {:error, %Ecto.Changeset{}} = Archive.update_container(container, @invalid_attrs)
      assert container == Archive.get_container!(container.id)
    end

    test "delete_container/1 deletes the container" do
      container = container_fixture()
      assert {:ok, %Container{}} = Archive.delete_container(container)
      assert_raise Ecto.NoResultsError, fn -> Archive.get_container!(container.id) end
    end

    test "change_container/1 returns a container changeset" do
      container = container_fixture()
      assert %Ecto.Changeset{} = Archive.change_container(container)
    end
  end

  describe "documents" do
    alias Safedoc.Archive.Document

    @valid_attrs %{code: "some code", customer_id: "some customer_id", status: "some status"}
    @update_attrs %{code: "some updated code", customer_id: "some updated customer_id", status: "some updated status"}
    @invalid_attrs %{code: nil, customer_id: nil, status: nil}

    def document_fixture(attrs \\ %{}) do
      {:ok, document} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Archive.create_document()

      document
    end

    test "list_documents/0 returns all documents" do
      document = document_fixture()
      assert Archive.list_documents() == [document]
    end

    test "get_document!/1 returns the document with given id" do
      document = document_fixture()
      assert Archive.get_document!(document.id) == document
    end

    test "create_document/1 with valid data creates a document" do
      assert {:ok, %Document{} = document} = Archive.create_document(@valid_attrs)
      assert document.code == "some code"
      assert document.customer_id == "some customer_id"
      assert document.status == "some status"
    end

    test "create_document/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Archive.create_document(@invalid_attrs)
    end

    test "update_document/2 with valid data updates the document" do
      document = document_fixture()
      assert {:ok, %Document{} = document} = Archive.update_document(document, @update_attrs)
      assert document.code == "some updated code"
      assert document.customer_id == "some updated customer_id"
      assert document.status == "some updated status"
    end

    test "update_document/2 with invalid data returns error changeset" do
      document = document_fixture()
      assert {:error, %Ecto.Changeset{}} = Archive.update_document(document, @invalid_attrs)
      assert document == Archive.get_document!(document.id)
    end

    test "delete_document/1 deletes the document" do
      document = document_fixture()
      assert {:ok, %Document{}} = Archive.delete_document(document)
      assert_raise Ecto.NoResultsError, fn -> Archive.get_document!(document.id) end
    end

    test "change_document/1 returns a document changeset" do
      document = document_fixture()
      assert %Ecto.Changeset{} = Archive.change_document(document)
    end
  end

  describe "services" do
    alias Safedoc.Archive.Service

    @valid_attrs %{status: "some status"}
    @update_attrs %{status: "some updated status"}
    @invalid_attrs %{status: nil}

    def service_fixture(attrs \\ %{}) do
      {:ok, service} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Archive.create_service()

      service
    end

    test "list_services/0 returns all services" do
      service = service_fixture()
      assert Archive.list_services() == [service]
    end

    test "get_service!/1 returns the service with given id" do
      service = service_fixture()
      assert Archive.get_service!(service.id) == service
    end

    test "create_service/1 with valid data creates a service" do
      assert {:ok, %Service{} = service} = Archive.create_service(@valid_attrs)
      assert service.status == "some status"
    end

    test "create_service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Archive.create_service(@invalid_attrs)
    end

    test "update_service/2 with valid data updates the service" do
      service = service_fixture()
      assert {:ok, %Service{} = service} = Archive.update_service(service, @update_attrs)
      assert service.status == "some updated status"
    end

    test "update_service/2 with invalid data returns error changeset" do
      service = service_fixture()
      assert {:error, %Ecto.Changeset{}} = Archive.update_service(service, @invalid_attrs)
      assert service == Archive.get_service!(service.id)
    end

    test "delete_service/1 deletes the service" do
      service = service_fixture()
      assert {:ok, %Service{}} = Archive.delete_service(service)
      assert_raise Ecto.NoResultsError, fn -> Archive.get_service!(service.id) end
    end

    test "change_service/1 returns a service changeset" do
      service = service_fixture()
      assert %Ecto.Changeset{} = Archive.change_service(service)
    end
  end
end
