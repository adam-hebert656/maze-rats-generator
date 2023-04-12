defmodule Mausgen.RollableTables.ClothingTable do
  alias Mausgen.RollableTables.RollHelper

  @table [
    ["Antique", "Battle-torn", "Bedraggled", "Blood-stained", "Ceremonial", "Dated"],
    ["Decaying", "Eccentric", "Elegant", "Embroidered", "Exotic", "Fashionable"],
    ["Flamboyant", "Food-stained", "Formal", "Frayed", "Frumpy", "Garish"],
    ["Grimy", "Haute courture", "Lacey", "Livery", "Mud-stained", "Ostentatious"],
    ["Oversized", "Patched", "Patterned", "Perfumed", "Practical", "Rumpled"],
    ["Singed", "Tasteless", "Tie-dye", "Undersized", "Wine-stained", "Worn out"]
  ]

  def roll_for_clothing() do
    RollHelper.roll_on_double_d6_table(@table)
  end
end
