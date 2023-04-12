defmodule Mausgen.RollableTables.RollHelper do
  def roll_on_double_d6_table(table) do
    first_roll = Enum.random(0..5)
    second_roll = Enum.random(0..5)

    parent_table = Enum.at(table, first_roll)
    Enum.at(parent_table, second_roll)
  end
end
