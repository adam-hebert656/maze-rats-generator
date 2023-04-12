defmodule Mausgen.Character do
  use Ecto.Schema
  import Ecto.Changeset

  schema "characters" do
    field(:name, :string)
    field(:feature, :string)

    field(:hp, :integer)
    field(:str, :integer)
    field(:dex, :integer)
    field(:will, :integer)

    field(:appearance, :string)
    field(:phys_detail, :string)
    field(:background, :string)
    field(:clothing, :string)
    field(:personality, :string)
    field(:mannerism, :string)

    field(:items, {:array, :string})
    field(:spells, {:array, :string})
  end

  def changeset(character, attrs) do
    character
    |> cast(attrs, [:name, :hp, :str, :dex, :will])
    |> validate_required([:name, :hp, :str, :dex, :will])
  end
end
