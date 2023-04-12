defmodule MausgenWeb.PageLive do
  use MausgenWeb, :live_view

  alias Mausgen.RollableTables.{
    ItemsTable,
    AppearanceTable,
    PhysDetailTable,
    BackgroundTable,
    ClothingTable
  }

  alias Mausgen.Character
  alias MausgenWeb.{AbilityScores, Details, Features, Items, PictureGenerator, Sheet}

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:character, %Character{items: [nil, nil, nil, nil, nil, nil]})
      |> assign(:current_step, 0)
      |> assign(:generated_images, nil)
      |> assign(:img_generation_attempts, 0)

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

    socket =
      socket
      |> assign(:character, up_character)
      |> assign(:current_step, current_step + 1)

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

  def handle_event(
        "roll_detail",
        %{"value" => "clothing"},
        %{assigns: %{character: character}} = socket
      ) do
    clothing = ClothingTable.roll_for_clothing()

    up_character = Map.replace(character, :clothing, clothing)

    {:noreply, assign(socket, :character, up_character)}
  end

  def handle_event(
        "choose_image",
        %{"url" => img_url},
        %{assigns: %{character: character, current_step: current_step}} = socket
      ) do
    {:ok, %{choices: [%{"message" => %{"content" => name}}]}} = OpenAI.chat_completion(
      model: "gpt-3.5-turbo",
      messages: [
        %{role: "user", content: "Generate a random fantasy first name for an adventurer with a background as #{character.background}"}
      ]
    )

    up_character = Map.replace(character, :image, img_url)
    up_character = Map.replace(up_character, :name, name)

    socket =
      socket
      |> assign(:character, up_character)
      |> assign(:current_step, current_step + 1)

    {:noreply, socket}
  end

  def handle_event("generate_images", _, %{assigns: %{character: character, img_generation_attempts: attempts}} = socket) do
    if (attempts < 3) do
      prompt = create_prompt(character)
      socket = case generate_images(prompt) do
        {:ok, %{data: pics} = _resp} ->
          assign(socket, :generated_images, Enum.map(pics, fn pic -> Map.get(pic, "url") end))

        {:error, err} ->
          put_flash(socket, :error, err)
      end

      {:noreply, assign(socket, :img_generation_attempts, attempts + 1)}
    else
      {:noreply, put_flash(socket, :error, "You have generated images the maximum amount of times!")}
    end
  end

  def generate_images(prompt) do
    OpenAI.images_generations(
      [prompt: prompt, size: "256x256", n: 4],
      recv_timeout: 10 * 60 * 1000
    )
  end

  def create_prompt(character) do
    "drawing, fantasy art style, portrait, adventurer, #{character.appearance}, #{character.phys_detail}, #{character.background}, #{character.clothing} clothing}"
  end
end
