defmodule SafedocWeb.Customer.DocumentController do
  use SafedocWeb, :controller

  alias Safedoc.Repo
  alias Safedoc.Archive
  alias Safedoc.Account
  alias Safedoc.Archive.Document

  plug :put_layout, "session.html" when action in [:show]


  def index(conn, %{"customer_id" => customer_id}) do
    customer = Account.get_customer!(customer_id)
    documents = Archive.list_documents(customer_id)
    render(conn, "index.html", documents: documents, customer: customer)
  end

  def new(conn, %{"customer_id" => customer_id}) do
    customer = Account.get_customer!(customer_id) |> Repo.preload([activity: :indexers])
    changeset = Archive.change_document(%Document{})
    render(conn, "new.html", changeset: changeset, customer: customer)
  end

  def create(conn, %{"customer_id" => customer_id, "document" => %{"cont" => cont}}) do
    customer = Account.get_customer!(customer_id)

    case Repo.transaction(fn ->
      {parse_cont, _} = Integer.parse(cont)
      Enum.to_list(1..parse_cont) |> Enum.each(fn item ->
        document_params = %{code: get_code("DOC", "SAFEDOC"), customer_id: customer_id}
        case Archive.create_document(document_params) do
          {:ok, container} ->
            {:ok, container}
          {:error, %Ecto.Changeset{} = changeset} ->
            Repo.rollback("Cannot create documents")
        end
      end)
    end) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Documents created successfully.")
        |> redirect(to: Routes.customer_document_path(conn, :index, customer))
      {:error, _} ->
        render(conn, "new.html")
    end
  end

  def show(conn, %{"customer_id" => customer_id, "id" => id}) do
    customer = Account.get_customer!(customer_id)
    document = Archive.get_document!(id)
    qr_code_svg = document.code
      |> EQRCode.encode()
      |> EQRCode.png()
      |> Base.encode64

    render(conn, "show.html", document: document, qrcode: qr_code_svg)
  end

  def edit(conn, %{"customer_id" => customer_id, "id" => id}) do
    customer = Account.get_customer!(customer_id)
    document = Archive.get_document!(id)
    changeset = Archive.change_document(document)
    render(conn, "edit.html", document: document, changeset: changeset, customer: customer)
  end

  def update(conn, %{"customer_id" => customer_id, "id" => id, "document" => document_params}) do
    customer = Account.get_customer!(customer_id)
    document = Archive.get_document!(id)

    case Archive.update_document(document, document_params) do
      {:ok, document} ->
        conn
        |> put_flash(:info, "Document updated successfully.")
        |> redirect(to: Routes.customer_document_path(conn, :index, customer))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", document: document, changeset: changeset, customer: customer)
    end
  end

  def delete(conn, %{"customer_id" => customer_id, "id" => id}) do
    customer = Account.get_customer!(customer_id)
    document = Archive.get_document!(id)
    {:ok, _document} = Archive.delete_document(document)

    conn
    |> put_flash(:info, "Document deleted successfully.")
    |> redirect(to: Routes.customer_document_path(conn, :index, customer: customer))
  end

  defp get_code(prefix, sufix) do
    "#{prefix}#{:os.system_time}#{sufix}"
  end
end
