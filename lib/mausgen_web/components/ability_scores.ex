defmodule MausgenWeb.AbilityScores do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="container grid rounded-lg mx-auto">
      <h1 class="font-mono text-3xl row-span-2 justify-self-center">
        Roll for your ability bonuses:
      </h1>
      <div class="grid grid-cols-3 py-10">
        <div class="grid grid-rows-4">
          <%= if @character.str == nil do %>
            <button
              phx-click="generate_ability"
              value="str"
              class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Roll
            </button>
          <% else %>
            <div class="flex flex-col row-span-2 font-bold text-5xl justify-self-center">
              +<%= @character.str %>
            </div>
            <button
              phx-click="generate_ability"
              value="str"
              class="w-2/4 justify-self-center rounded-lg row-span-1 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Reroll
            </button>
          <% end %>
          <div class="row-span-1 font-bold text-lg justify-self-center">Strength</div>
        </div>
        <div class="grid grid-rows-4">
          <%= if @character.dex == nil do %>
            <button
              phx-click="generate_ability"
              value="dex"
              class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Roll
            </button>
          <% else %>
            <div class="flex flex-col row-span-2 font-bold text-5xl justify-self-center">
              +<%= @character.dex %>
            </div>
            <button
              phx-click="generate_ability"
              value="dex"
              class="w-2/4 justify-self-center rounded-lg row-span-1 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Reroll
            </button>
          <% end %>
          <div class="row-span-1 font-bold text-lg justify-self-center">Dexterity</div>
        </div>
        <div class="grid grid-rows-4">
          <%= if @character.will == nil do %>
            <button
              phx-click="generate_ability"
              value="will"
              class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Roll
            </button>
          <% else %>
            <div class="flex flex-col row-span-2 font-bold text-5xl justify-self-center">
              +<%= @character.will %>
            </div>
            <button
              phx-click="generate_ability"
              value="will"
              class="w-2/4 justify-self-center rounded-lg row-span-1 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Reroll
            </button>
          <% end %>
          <div class="row-span-1 font-bold text-lg justify-self-center">Will</div>
        </div>
        <%= if @character.str != nil && @character.dex != nil && @character.will != nil do %>
          <button
            phx-click="next_step"
            class="w-2/4 justify-self-center rounded-lg col-span-3 py-5 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
          >
            Next: Choose a Starting Feature
          </button>
        <% end %>
      </div>
    </div>
    """
  end
end
