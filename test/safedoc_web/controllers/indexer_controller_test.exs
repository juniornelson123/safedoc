defmodule SafedocWeb.IndexerControllerTest do
  use SafedocWeb.ConnCase

  alias Safedoc.Setting

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:indexer) do
    {:ok, indexer} = Setting.create_indexer(@create_attrs)
    indexer
  end

  describe "index" do
    test "lists all name", %{conn: conn} do
      conn = get(conn, Routes.indexer_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Name"
    end
  end

  describe "new indexer" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.indexer_path(conn, :new))
      assert html_response(conn, 200) =~ "New Indexer"
    end
  end

  describe "create indexer" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.indexer_path(conn, :create), indexer: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.indexer_path(conn, :show, id)

      conn = get(conn, Routes.indexer_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Indexer"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.indexer_path(conn, :create), indexer: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Indexer"
    end
  end

  describe "edit indexer" do
    setup [:create_indexer]

    test "renders form for editing chosen indexer", %{conn: conn, indexer: indexer} do
      conn = get(conn, Routes.indexer_path(conn, :edit, indexer))
      assert html_response(conn, 200) =~ "Edit Indexer"
    end
  end

  describe "update indexer" do
    setup [:create_indexer]

    test "redirects when data is valid", %{conn: conn, indexer: indexer} do
      conn = put(conn, Routes.indexer_path(conn, :update, indexer), indexer: @update_attrs)
      assert redirected_to(conn) == Routes.indexer_path(conn, :show, indexer)

      conn = get(conn, Routes.indexer_path(conn, :show, indexer))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, indexer: indexer} do
      conn = put(conn, Routes.indexer_path(conn, :update, indexer), indexer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Indexer"
    end
  end

  describe "delete indexer" do
    setup [:create_indexer]

    test "deletes chosen indexer", %{conn: conn, indexer: indexer} do
      conn = delete(conn, Routes.indexer_path(conn, :delete, indexer))
      assert redirected_to(conn) == Routes.indexer_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.indexer_path(conn, :show, indexer))
      end
    end
  end

  defp create_indexer(_) do
    indexer = fixture(:indexer)
    {:ok, indexer: indexer}
  end
end
