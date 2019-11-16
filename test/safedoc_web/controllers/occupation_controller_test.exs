defmodule SafedocWeb.OccupationControllerTest do
  use SafedocWeb.ConnCase

  alias Safedoc.Setting

  @create_attrs %{date_end: ~N[2010-04-17 14:00:00], date_start: ~N[2010-04-17 14:00:00], status: "some status"}
  @update_attrs %{date_end: ~N[2011-05-18 15:01:01], date_start: ~N[2011-05-18 15:01:01], status: "some updated status"}
  @invalid_attrs %{date_end: nil, date_start: nil, status: nil}

  def fixture(:occupation) do
    {:ok, occupation} = Setting.create_occupation(@create_attrs)
    occupation
  end

  describe "index" do
    test "lists all occupations", %{conn: conn} do
      conn = get(conn, Routes.occupation_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Occupations"
    end
  end

  describe "new occupation" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.occupation_path(conn, :new))
      assert html_response(conn, 200) =~ "New Occupation"
    end
  end

  describe "create occupation" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.occupation_path(conn, :create), occupation: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.occupation_path(conn, :show, id)

      conn = get(conn, Routes.occupation_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Occupation"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.occupation_path(conn, :create), occupation: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Occupation"
    end
  end

  describe "edit occupation" do
    setup [:create_occupation]

    test "renders form for editing chosen occupation", %{conn: conn, occupation: occupation} do
      conn = get(conn, Routes.occupation_path(conn, :edit, occupation))
      assert html_response(conn, 200) =~ "Edit Occupation"
    end
  end

  describe "update occupation" do
    setup [:create_occupation]

    test "redirects when data is valid", %{conn: conn, occupation: occupation} do
      conn = put(conn, Routes.occupation_path(conn, :update, occupation), occupation: @update_attrs)
      assert redirected_to(conn) == Routes.occupation_path(conn, :show, occupation)

      conn = get(conn, Routes.occupation_path(conn, :show, occupation))
      assert html_response(conn, 200) =~ "some updated status"
    end

    test "renders errors when data is invalid", %{conn: conn, occupation: occupation} do
      conn = put(conn, Routes.occupation_path(conn, :update, occupation), occupation: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Occupation"
    end
  end

  describe "delete occupation" do
    setup [:create_occupation]

    test "deletes chosen occupation", %{conn: conn, occupation: occupation} do
      conn = delete(conn, Routes.occupation_path(conn, :delete, occupation))
      assert redirected_to(conn) == Routes.occupation_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.occupation_path(conn, :show, occupation))
      end
    end
  end

  defp create_occupation(_) do
    occupation = fixture(:occupation)
    {:ok, occupation: occupation}
  end
end
