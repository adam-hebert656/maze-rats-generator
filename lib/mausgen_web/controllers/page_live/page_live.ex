defmodule MausgenWeb.PageLive do
  use MausgenWeb, :live_view

  alias Mausgen.RollableTables.{ItemsTable, AppearanceTable, PhysDetailTable, BackgroundTable}
  alias Mausgen.Character
  alias MausgenWeb.{AbilityScores, Details, Features, Items}

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:character, %Character{items: [nil, nil, nil, nil, nil, nil]})
      |> assign(:current_step, 0)

    {:ok, socket}
  end

  def roll_for_ability_score() do
    case Enum.random(1..3) do
      1 -> 0
      2 -> 0
      3 -> 1
      4 -> 1
      5 -> 1
      6 -> 2
    end
  end

  def handle_event(
        "generate_ability",
        %{"value" => ability},
        %{assigns: %{character: character}} = socket
      ) do
    new_score = roll_for_ability_score()

    up_character = Map.replace(character, String.to_existing_atom(ability), new_score)

    {:noreply, assign(socket, :character, up_character)}
  end

  def handle_event("next_step", _, %{assigns: %{current_step: current_step}} = socket) do
    next_step = current_step + 1
    {:noreply, assign(socket, :current_step, next_step)}
  end

  def handle_event(
        "choose_feature",
        %{"value" => feature},
        %{assigns: %{character: character, current_step: current_step}} = socket
      ) do
    up_character = Map.replace(character, :feature, feature)

    next_step = current_step + 1

    socket =
      socket
      |> assign(:character, up_character)
      |> assign(:current_step, next_step)

    {:noreply, socket}
  end

  def handle_event(
        "roll_item",
        %{"value" => item_slot},
        %{assigns: %{character: %{items: items} = character}} = socket
      ) do
    item = ItemsTable.roll_for_item()

    up_items = List.replace_at(items, String.to_integer(item_slot), item)
    IO.inspect(up_items)
    up_character = Map.replace(character, :items, up_items)

    {:noreply, assign(socket, :character, up_character)}
  end

  def handle_event(
        "roll_detail",
        %{"value" => "appearance"},
        %{assigns: %{character: character}} = socket
      ) do
    new_appearance = AppearanceTable.roll_for_appearance()

    up_character = Map.replace(character, :appearance, new_appearance)

    {:noreply, assign(socket, :character, up_character)}
  end

  def handle_event(
        "roll_detail",
        %{"value" => "phys_detail"},
        %{assigns: %{character: character}} = socket
      ) do
    phys_detail = PhysDetailTable.roll_for_phys_detail()

    up_character = Map.replace(character, :phys_detail, phys_detail)

    {:noreply, assign(socket, :character, up_character)}
  end

  def handle_event(
        "roll_detail",
        %{"value" => "background"},
        %{assigns: %{character: character}} = socket
      ) do
    background = BackgroundTable.roll_for_background()

    up_character = Map.replace(character, :background, background)

    {:noreply, assign(socket, :character, up_character)}
  end
end
