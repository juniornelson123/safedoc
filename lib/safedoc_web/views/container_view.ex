defmodule SafedocWeb.ContainerView do
  use SafedocWeb, :view
  alias Safedoc.Archive

  def categories do
    Archive.list_categories |> Enum.map(fn category -> [key: category.name, value: category.id] end )
  end

end
