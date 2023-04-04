defmodule Mausgen.Character do
  use Ecto.Schema
  import Ecto.Changeset

  schema "characters" do
    field(:name, :string)
    field(:ancestry, :string)

    field(:hp, :integer)
    field(:str, :integer)
    field(:dex, :integer)
    field(:con, :integer)
    field(:int, :integer)
    field(:psy, :integer)
    field(:ego, :integer)
  end

  def changeset(character, attrs) do
    character
    |> cast(attrs, [:name, :ancestry, :hp, :str, :dex, :con, :int, :psy, :ego])
    |> validate_required([:name, :ancestry, :hp, :str, :dex, :con, :int, :psy, :ego])
  end
end
