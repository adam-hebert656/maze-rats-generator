defmodule MausgenWeb.PageLive do
  use MausgenWeb, :live_view

  alias Mausgen.Character

  def mount(_params, _session, socket) do
    socket = assign(socket, :character, %Character{})
    {:ok, socket}
  end

  def roll_for_ability_bonus() do
    Enum.min([Enum.random(1..6), Enum.random(1..6), Enum.random(1..6)])
  end

  def handle_event("generate_str", _value, socket) do
    new_str = roll_for_ability_bonus()
    up_character = Map.replace(socket.assigns.character, :str, new_str)
    {:noreply, assign(socket, :character, up_character)}
  end

  def render(assigns) do
    ~H"""
    <div class="container mx-auto px-10 h-screen py-10 bg-sky-600 grid grid-rows-6">
      <div class="container rounded-lg mx-auto flex justify-center">
        <h1 class="font-mono text-5xl">Generate your brave adventurer...</h1>
      </div>
      <div class="container grid rounded-lg mx-auto">
        <h1 class="font-mono text-3xl row-span-2 justify-self-center">
          Roll for your ability scores:
        </h1>
        <div class="grid grid-cols-6 py-10">
          <div class="grid grid-rows-4">
            <%= if @character.str == nil do %>
              <button
                phx-click="generate_str"
                class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
              >
                Roll
              </button>
            <% else %>
              <div class="flex flex-col row-span-3 font-bold text-lg justify-self-center">
                <div>Bonus: <%= @character.str %></div>
                <div>Defence: <%= @character.str + 10 %></div>
              </div>
            <% end %>
            <div class="row-span-1 font-bold text-lg justify-self-center">Strength</div>
          </div>
          <div class="grid grid-rows-4">
            <div class="row-span-1 font-bold text-lg justify-self-center">Dexterity</div>
            <button class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black">
              Roll
            </button>
          </div>
          <div class="grid grid-rows-4">
            <div class="row-span-1 font-bold text-lg justify-self-center">Constitution</div>
            <button class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black">
              Roll
            </button>
          </div>
          <div class="grid grid-rows-4">
            <div class="row-span-1 font-bold text-lg justify-self-center">Intellect</div>
            <button class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black">
              Roll
            </button>
          </div>
          <div class="grid grid-rows-4">
            <div class="row-span-1 font-bold text-lg justify-self-center">Psyche</div>
            <button class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black">
              Roll
            </button>
          </div>
          <div class="grid grid-rows-4">
            <div class="row-span-1 font-bold text-lg justify-self-center">Ego</div>
            <button class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black">
              Roll
            </button>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
