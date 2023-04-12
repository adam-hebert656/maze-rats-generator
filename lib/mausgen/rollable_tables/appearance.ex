defmodule Mausgen.RollableTables.AppearanceTable do
  alias Mausgen.RollableTables.RollHelper

  @table [
    ["Aquiline", "Athletic", "Barrel-chested", "Boney", "Brawny", "Brutish"],
    ["Bullnecked", "Chiseled", "Coltish", "Corpulent", "Craggy", "Delicate"],
    ["Furrowed", "Gaunt", "Gorgeous", "Grizzled", "Haggard", "Handsome"],
    ["Hideous", "Lanky", "Pudgy", "Ripped", "Rosy", "Scrawny"],
    ["Sinewy", "Slender", "Slumped", "Solid", "Square-jawed", "Statuesque"],
    ["Towering", "Trim", "Weathered", "Willowy", "Wiry", "Wrinkled"]
  ]

  def roll_for_appearance() do
    RollHelper.roll_on_double_d6_table(@table)
  end
end
