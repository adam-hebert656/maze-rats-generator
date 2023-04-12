defmodule Mausgen.RollableTables.PhysDetailTable do
  alias Mausgen.RollableTables.RollHelper

  @table [
    ["Acid scars", "Battle scars", "Birthmark", "Braided hair", "Brand mark", "Broken nose"],
    ["Bronze skin", "Burn scars", "Bushy eyebrows", "Curly hair", "Dark skin", "Dreadlocks"],
    ["Exotic accent", "Flogging scars", "Freckles", "Gold tooth", "Hoarse voice", "Huge beard"],
    ["Long hair", "Matted hair", "Missing ear", "Missing teeth", "Mustache", "Muttonchops"],
    ["Nine fingers", "Oiled hair", "One-eyed", "Pale skinned", "Piercings", "Ritual scars"],
    ["Sallow skin", "Shaved head", "Sunburned", "Tangled hair", "Tattoos", "Topknot"]
  ]

  def roll_for_phys_detail() do
    RollHelper.roll_on_double_d6_table(@table)
  end
end
