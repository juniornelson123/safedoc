defmodule SafedocWeb.Customer.Document.IndexerDataController do
  use SafedocWeb, :controller

  alias Safedoc.Repo
  alias Safedoc.Archive
  alias Safedoc.Account
  alias Safedoc.Setting
  alias Safedoc.Setting.IndexerData

  def index(conn, %{"document_id" => document_id, "customer_id" => customer_id}) do
    document = Archive.get_document!(document_id) |> Repo.preload([:indexers_data])
    customer = Account.get_customer!(customer_id) |> Repo.preload([activity: :indexers])
    indexer_datas = Setting.list_indexer_datas(document_id) |> Repo.preload([:indexer])
    render(conn, "index.html", indexer_datas: indexer_datas, document: document, customer: customer)
  end

  def new(conn, %{"document_id" => document_id, "customer_id" => customer_id}) do
    document = Archive.get_document!(document_id)
    customer = Account.get_customer!(customer_id) |> Repo.preload([activity: :indexers])

    changeset = Setting.change_indexer_data(%IndexerData{})
    render(conn, "new.html", changeset: changeset, document: document, customer: customer)
  end

  def create(conn, %{"indexer_data" => indexer_data_params, "document_id" => document_id, "customer_id" => customer_id}) do
    document = Archive.get_document!(document_id)
    customer = Account.get_customer!(customer_id)

    indexer_data_params = indexer_data_params |> Map.values
    case Repo.transaction(fn ->
      indexer_data_params |> Enum.each(fn indexer ->
        case Setting.create_indexer_data(indexer) do
          {:ok, indexer_data} ->
            {:ok, indexer_data}
          {:error, %Ecto.Changeset{} = changeset} ->
            Repo.rollback("Cannot create indexers")

        end
      end)
    end) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Indexer data created successfully.")
        |> redirect(to: Routes.customer_document_indexer_data_path(conn, :index, customer, document))

      {:error, _} ->
        render(conn, "new.html", document: document, customer: customer)
    end

  end

  def show(conn, %{"id" => id, "document_id" => document_id, "customer_id" => customer_id}) do
    document = Archive.get_document!(document_id)
    customer = Account.get_customer!(customer_id)

    indexer_data = Setting.get_indexer_data!(id)
    render(conn, "show.html", indexer_data: indexer_data, document: document, customer: customer)
  end

  def edit(conn, %{"id" => id, "document_id" => document_id, "customer_id" => customer_id}) do
    document = Archive.get_document!(document_id) |> Repo.preload([indexers_data: :indexer])
    customer = Account.get_customer!(customer_id) |> Repo.preload([activity: :indexers])

    # indexer_data = Setting.get_indexer_data!(id)
    # changeset = Setting.change_indexer_data(indexer_data)
    render(conn, "edit.html", document: document, customer: customer)
  end

  def update(conn, %{"id" => id, "indexer_data" => indexer_data_params, "document_id" => document_id, "customer_id" => customer_id}) do
    document = Archive.get_document!(document_id) |> Repo.preload([indexers_data: :indexer])
    customer = Account.get_customer!(customer_id) |> Repo.preload([activity: :indexers])

    indexer_data_params = indexer_data_params |> Map.values
    case Repo.transaction(fn ->
      indexer_data_params |> Enum.each(fn indexer ->
        indexer_data = Setting.get_indexer_data!(indexer["id"])
        case Setting.update_indexer_data(indexer_data, indexer) do
          {:ok, indexer_data} ->
            conn
            |> put_flash(:info, "Indexer data updated successfully.")
            |> redirect(to: Routes.customer_document_indexer_data_path(conn, :index, customer, document))

          {:error, %Ecto.Changeset{} = changeset} ->
            Repo.rollback("Cannot update indexers")
        end
      end)
    end) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Indexer data updated successfully.")
        |> redirect(to: Routes.customer_document_indexer_data_path(conn, :index, customer, document))

      {:error, _} ->
        render(conn, "edit.html", document: document, customer: customer)
    end

  end

  def delete(conn, %{"id" => id, "document_id" => document_id, "customer_id" => customer_id}) do
    document = Archive.get_document!(document_id)
    customer = Account.get_customer!(customer_id)

    indexer_data = Setting.get_indexer_data!(id)
    {:ok, _indexer_data} = Setting.delete_indexer_data(indexer_data)

    conn
    |> put_flash(:info, "Indexer data deleted successfully.")
    |> redirect(to: Routes.indexer_data_path(conn, :index))
  end
end
