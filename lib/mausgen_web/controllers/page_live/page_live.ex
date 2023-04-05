defmodule MausgenWeb.PageLive do
  use MausgenWeb, :live_view

  alias Mausgen.Character
  alias MausgenWeb.AbilityScores

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:character, %Character{})

    {:ok, socket}
  end

  def roll_for_ability_bonus() do
    Enum.min([Enum.random(1..6), Enum.random(1..6), Enum.random(1..6)])
  end

  def handle_event("generate_ability", %{"value" => ability}, socket) do
    new_score = roll_for_ability_bonus()

    up_character =
      Map.replace(socket.assigns.character, String.to_existing_atom(ability), new_score)

    {:noreply, assign(socket, :character, up_character)}
  end
end
