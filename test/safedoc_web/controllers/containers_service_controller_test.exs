defmodule SafedocWeb.ContainersServiceControllerTest do
  use SafedocWeb.ConnCase

  alias Safedoc.Setting

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:containers_service) do
    {:ok, containers_service} = Setting.create_containers_service(@create_attrs)
    containers_service
  end

  describe "index" do
    test "lists all containers_services", %{conn: conn} do
      conn = get(conn, Routes.containers_service_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Containers services"
    end
  end

  describe "new containers_service" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.containers_service_path(conn, :new))
      assert html_response(conn, 200) =~ "New Containers service"
    end
  end

  describe "create containers_service" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.containers_service_path(conn, :create), containers_service: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.containers_service_path(conn, :show, id)

      conn = get(conn, Routes.containers_service_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Containers service"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.containers_service_path(conn, :create), containers_service: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Containers service"
    end
  end

  describe "edit containers_service" do
    setup [:create_containers_service]

    test "renders form for editing chosen containers_service", %{conn: conn, containers_service: containers_service} do
      conn = get(conn, Routes.containers_service_path(conn, :edit, containers_service))
      assert html_response(conn, 200) =~ "Edit Containers service"
    end
  end

  describe "update containers_service" do
    setup [:create_containers_service]

    test "redirects when data is valid", %{conn: conn, containers_service: containers_service} do
      conn = put(conn, Routes.containers_service_path(conn, :update, containers_service), containers_service: @update_attrs)
      assert redirected_to(conn) == Routes.containers_service_path(conn, :show, containers_service)

      conn = get(conn, Routes.containers_service_path(conn, :show, containers_service))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, containers_service: containers_service} do
      conn = put(conn, Routes.containers_service_path(conn, :update, containers_service), containers_service: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Containers service"
    end
  end

  describe "delete containers_service" do
    setup [:create_containers_service]

    test "deletes chosen containers_service", %{conn: conn, containers_service: containers_service} do
      conn = delete(conn, Routes.containers_service_path(conn, :delete, containers_service))
      assert redirected_to(conn) == Routes.containers_service_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.containers_service_path(conn, :show, containers_service))
      end
    end
  end

  defp create_containers_service(_) do
    containers_service = fixture(:containers_service)
    {:ok, containers_service: containers_service}
  end
end
