defmodule SafedocWeb.CustomerView do
  use SafedocWeb, :view
  alias Safedoc.Setting

  def activities do
    Setting.list_activities |> Enum.map(fn activity -> [key: activity.name, value: activity.id] end )
  end
end
