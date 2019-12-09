defmodule SafedocWeb.Customer.DocumentView do
  use SafedocWeb, :view
  alias Safedoc.Archive

  def container_documents do
    Archive.list_containers_documents |> Enum.map(fn container -> [key: container.code, value: container.id] end )
  end
end
