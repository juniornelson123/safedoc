defmodule SafedocWeb.OccupationView do
  use SafedocWeb, :view
  alias Safedoc.Setting
  def categories do
    Setting.list_steps |> Enum.map(fn step -> [key: step.name, value: step.id] end )
  end
end
