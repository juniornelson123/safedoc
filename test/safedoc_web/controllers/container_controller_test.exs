defmodule SafedocWeb.ContainerControllerTest do
  use SafedocWeb.ConnCase

  alias Safedoc.Archive

  @create_attrs %{code: "some code", description: "some description"}
  @update_attrs %{code: "some updated code", description: "some updated description"}
  @invalid_attrs %{code: nil, description: nil}

  def fixture(:container) do
    {:ok, container} = Archive.create_container(@create_attrs)
    container
  end

  describe "index" do
    test "lists all containers", %{conn: conn} do
      conn = get(conn, Routes.container_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Containers"
    end
  end

  describe "new container" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.container_path(conn, :new))
      assert html_response(conn, 200) =~ "New Container"
    end
  end

  describe "create container" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.container_path(conn, :create), container: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.container_path(conn, :show, id)

      conn = get(conn, Routes.container_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Container"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.container_path(conn, :create), container: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Container"
    end
  end

  describe "edit container" do
    setup [:create_container]

    test "renders form for editing chosen container", %{conn: conn, container: container} do
      conn = get(conn, Routes.container_path(conn, :edit, container))
      assert html_response(conn, 200) =~ "Edit Container"
    end
  end

  describe "update container" do
    setup [:create_container]

    test "redirects when data is valid", %{conn: conn, container: container} do
      conn = put(conn, Routes.container_path(conn, :update, container), container: @update_attrs)
      assert redirected_to(conn) == Routes.container_path(conn, :show, container)

      conn = get(conn, Routes.container_path(conn, :show, container))
      assert html_response(conn, 200) =~ "some updated code"
    end

    test "renders errors when data is invalid", %{conn: conn, container: container} do
      conn = put(conn, Routes.container_path(conn, :update, container), container: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Container"
    end
  end

  describe "delete container" do
    setup [:create_container]

    test "deletes chosen container", %{conn: conn, container: container} do
      conn = delete(conn, Routes.container_path(conn, :delete, container))
      assert redirected_to(conn) == Routes.container_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.container_path(conn, :show, container))
      end
    end
  end

  defp create_container(_) do
    container = fixture(:container)
    {:ok, container: container}
  end
end
