defmodule SafedocWeb.IndexerDataControllerTest do
  use SafedocWeb.ConnCase

  alias Safedoc.Setting

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:indexer_data) do
    {:ok, indexer_data} = Setting.create_indexer_data(@create_attrs)
    indexer_data
  end

  describe "index" do
    test "lists all name", %{conn: conn} do
      conn = get(conn, Routes.indexer_data_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Name"
    end
  end

  describe "new indexer_data" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.indexer_data_path(conn, :new))
      assert html_response(conn, 200) =~ "New Indexer data"
    end
  end

  describe "create indexer_data" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.indexer_data_path(conn, :create), indexer_data: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.indexer_data_path(conn, :show, id)

      conn = get(conn, Routes.indexer_data_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Indexer data"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.indexer_data_path(conn, :create), indexer_data: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Indexer data"
    end
  end

  describe "edit indexer_data" do
    setup [:create_indexer_data]

    test "renders form for editing chosen indexer_data", %{conn: conn, indexer_data: indexer_data} do
      conn = get(conn, Routes.indexer_data_path(conn, :edit, indexer_data))
      assert html_response(conn, 200) =~ "Edit Indexer data"
    end
  end

  describe "update indexer_data" do
    setup [:create_indexer_data]

    test "redirects when data is valid", %{conn: conn, indexer_data: indexer_data} do
      conn = put(conn, Routes.indexer_data_path(conn, :update, indexer_data), indexer_data: @update_attrs)
      assert redirected_to(conn) == Routes.indexer_data_path(conn, :show, indexer_data)

      conn = get(conn, Routes.indexer_data_path(conn, :show, indexer_data))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, indexer_data: indexer_data} do
      conn = put(conn, Routes.indexer_data_path(conn, :update, indexer_data), indexer_data: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Indexer data"
    end
  end

  describe "delete indexer_data" do
    setup [:create_indexer_data]

    test "deletes chosen indexer_data", %{conn: conn, indexer_data: indexer_data} do
      conn = delete(conn, Routes.indexer_data_path(conn, :delete, indexer_data))
      assert redirected_to(conn) == Routes.indexer_data_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.indexer_data_path(conn, :show, indexer_data))
      end
    end
  end

  defp create_indexer_data(_) do
    indexer_data = fixture(:indexer_data)
    {:ok, indexer_data: indexer_data}
  end
end
