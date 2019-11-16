defmodule SafedocWeb.CustomerControllerTest do
  use SafedocWeb.ConnCase

  alias Safedoc.Account

  @create_attrs %{cnpj: "some cnpj", code: "some code", cpf: "some cpf", fantasy_name: "some fantasy_name", kind: "some kind", municipal_registration: "some municipal_registration", reason_social: "some reason_social", rg: "some rg", state_registration: "some state_registration", status: "some status"}
  @update_attrs %{cnpj: "some updated cnpj", code: "some updated code", cpf: "some updated cpf", fantasy_name: "some updated fantasy_name", kind: "some updated kind", municipal_registration: "some updated municipal_registration", reason_social: "some updated reason_social", rg: "some updated rg", state_registration: "some updated state_registration", status: "some updated status"}
  @invalid_attrs %{cnpj: nil, code: nil, cpf: nil, fantasy_name: nil, kind: nil, municipal_registration: nil, reason_social: nil, rg: nil, state_registration: nil, status: nil}

  def fixture(:customer) do
    {:ok, customer} = Account.create_customer(@create_attrs)
    customer
  end

  describe "index" do
    test "lists all customers", %{conn: conn} do
      conn = get(conn, Routes.customer_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Customers"
    end
  end

  describe "new customer" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.customer_path(conn, :new))
      assert html_response(conn, 200) =~ "New Customer"
    end
  end

  describe "create customer" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.customer_path(conn, :create), customer: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.customer_path(conn, :show, id)

      conn = get(conn, Routes.customer_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Customer"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.customer_path(conn, :create), customer: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Customer"
    end
  end

  describe "edit customer" do
    setup [:create_customer]

    test "renders form for editing chosen customer", %{conn: conn, customer: customer} do
      conn = get(conn, Routes.customer_path(conn, :edit, customer))
      assert html_response(conn, 200) =~ "Edit Customer"
    end
  end

  describe "update customer" do
    setup [:create_customer]

    test "redirects when data is valid", %{conn: conn, customer: customer} do
      conn = put(conn, Routes.customer_path(conn, :update, customer), customer: @update_attrs)
      assert redirected_to(conn) == Routes.customer_path(conn, :show, customer)

      conn = get(conn, Routes.customer_path(conn, :show, customer))
      assert html_response(conn, 200) =~ "some updated cnpj"
    end

    test "renders errors when data is invalid", %{conn: conn, customer: customer} do
      conn = put(conn, Routes.customer_path(conn, :update, customer), customer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Customer"
    end
  end

  describe "delete customer" do
    setup [:create_customer]

    test "deletes chosen customer", %{conn: conn, customer: customer} do
      conn = delete(conn, Routes.customer_path(conn, :delete, customer))
      assert redirected_to(conn) == Routes.customer_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.customer_path(conn, :show, customer))
      end
    end
  end

  defp create_customer(_) do
    customer = fixture(:customer)
    {:ok, customer: customer}
  end
end
