defmodule SafedocWeb.CollaboratorControllerTest do
  use SafedocWeb.ConnCase

  alias Safedoc.Account

  @create_attrs %{office: "some office", status: "some status"}
  @update_attrs %{office: "some updated office", status: "some updated status"}
  @invalid_attrs %{office: nil, status: nil}

  def fixture(:collaborator) do
    {:ok, collaborator} = Account.create_collaborator(@create_attrs)
    collaborator
  end

  describe "index" do
    test "lists all collaborators", %{conn: conn} do
      conn = get(conn, Routes.collaborator_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Collaborators"
    end
  end

  describe "new collaborator" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.collaborator_path(conn, :new))
      assert html_response(conn, 200) =~ "New Collaborator"
    end
  end

  describe "create collaborator" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.collaborator_path(conn, :create), collaborator: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.collaborator_path(conn, :show, id)

      conn = get(conn, Routes.collaborator_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Collaborator"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.collaborator_path(conn, :create), collaborator: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Collaborator"
    end
  end

  describe "edit collaborator" do
    setup [:create_collaborator]

    test "renders form for editing chosen collaborator", %{conn: conn, collaborator: collaborator} do
      conn = get(conn, Routes.collaborator_path(conn, :edit, collaborator))
      assert html_response(conn, 200) =~ "Edit Collaborator"
    end
  end

  describe "update collaborator" do
    setup [:create_collaborator]

    test "redirects when data is valid", %{conn: conn, collaborator: collaborator} do
      conn = put(conn, Routes.collaborator_path(conn, :update, collaborator), collaborator: @update_attrs)
      assert redirected_to(conn) == Routes.collaborator_path(conn, :show, collaborator)

      conn = get(conn, Routes.collaborator_path(conn, :show, collaborator))
      assert html_response(conn, 200) =~ "some updated office"
    end

    test "renders errors when data is invalid", %{conn: conn, collaborator: collaborator} do
      conn = put(conn, Routes.collaborator_path(conn, :update, collaborator), collaborator: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Collaborator"
    end
  end

  describe "delete collaborator" do
    setup [:create_collaborator]

    test "deletes chosen collaborator", %{conn: conn, collaborator: collaborator} do
      conn = delete(conn, Routes.collaborator_path(conn, :delete, collaborator))
      assert redirected_to(conn) == Routes.collaborator_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.collaborator_path(conn, :show, collaborator))
      end
    end
  end

  defp create_collaborator(_) do
    collaborator = fixture(:collaborator)
    {:ok, collaborator: collaborator}
  end
end
