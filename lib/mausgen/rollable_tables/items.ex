defmodule Mausgen.RollableTables.ItemsTable do
  alias Mausgen.RollableTables.RollHelper

  @table [
    ["Animal Scent", "Bear Trap", "Bedroll", "Caltrops", "Chain (10 ft)", "Chalk"],
    ["Chisel", "Crowbar", "Fishing Net", "Glass Marbles", "Glue", "Grappling Hook"],
    ["Grease", "Hacksaw", "Hammer", "Hand Drill", "Horn", "Iron Spikes"],
    ["Iron Tongs", "Lantern & Oil", "Large Sack", "Lockpicks (3)", "Manacles", "Medicine (3)"],
    ["Metal File", "Rations (3)", "Rope (50ft)", "Steel Wire", "Shovel", "Steel Mirror"],
    ["Ten Foot Pole", "Tinderbox", "Torch", "Vial of Acid", "Vial of Poison", "Waterskin"]
  ]

  def roll_for_item() do
    RollHelper.roll_on_double_d6_table(@table)
  end
end
