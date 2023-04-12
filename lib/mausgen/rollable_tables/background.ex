defmodule Mausgen.RollableTables.BackgroundTable do
  @table [
    "Alchemist",
    "Beggar",
    "Butcher",
    "Burglar",
    "Charlatan",
    "Cleric",
    "Cook",
    "Cultist",
    "Gambler",
    "Herbalist",
    "Magician",
    "Mariner",
    "Mercenary",
    "Merchant",
    "Outlaw",
    "Performer",
    "Pickpocket",
    "Smuggler",
    "Student",
    "Tracker"
  ]

  def roll_for_background() do
    roll = Enum.random(0..19)
    Enum.at(@table, roll)
  end
end
