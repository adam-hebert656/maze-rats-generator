defmodule MausgenWeb.AbilityScores do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="container grid rounded-lg mx-auto">
      <h1 class="font-mono text-3xl row-span-2 justify-self-center">
        Roll for your ability bonuses:
      </h1>
      <div class="grid grid-cols-6 py-10">
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
              <%= @character.str %>
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
              <%= @character.dex %>
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
          <%= if @character.con == nil do %>
            <button
              phx-click="generate_ability"
              value="con"
              class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Roll
            </button>
          <% else %>
            <div class="flex flex-col row-span-2 font-bold text-5xl justify-self-center">
              <%= @character.con %>
            </div>
            <button
              phx-click="generate_ability"
              value="con"
              class="w-2/4 justify-self-center rounded-lg row-span-1 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Reroll
            </button>
          <% end %>
          <div class="row-span-1 font-bold text-lg justify-self-center">Constitution</div>
        </div>
        <div class="grid grid-rows-4">
          <%= if @character.int == nil do %>
            <button
              phx-click="generate_ability"
              value="int"
              class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Roll
            </button>
          <% else %>
            <div class="flex flex-col row-span-2 font-bold text-5xl justify-self-center">
              <%= @character.int %>
            </div>
            <button
              phx-click="generate_ability"
              value="int"
              class="w-2/4 justify-self-center rounded-lg row-span-1 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Reroll
            </button>
          <% end %>
          <div class="row-span-1 font-bold text-lg justify-self-center">Intellect</div>
        </div>
        <div class="grid grid-rows-4">
          <%= if @character.psy == nil do %>
            <button
              phx-click="generate_ability"
              value="psy"
              class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Roll
            </button>
          <% else %>
            <div class="flex flex-col row-span-2 font-bold text-5xl justify-self-center">
              <%= @character.psy %>
            </div>
            <button
              phx-click="generate_ability"
              value="psy"
              class="w-2/4 justify-self-center rounded-lg row-span-1 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Reroll
            </button>
          <% end %>
          <div class="row-span-1 font-bold text-lg justify-self-center">Psyche</div>
        </div>
        <div class="grid grid-rows-4">
          <%= if @character.ego == nil do %>
            <button
              phx-click="generate_ability"
              value="ego"
              class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Roll
            </button>
          <% else %>
            <div class="flex flex-col row-span-2 font-bold text-5xl justify-self-center">
              <%= @character.ego %>
            </div>
            <button
              phx-click="generate_ability"
              value="ego"
              class="w-2/4 justify-self-center rounded-lg row-span-1 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Reroll
            </button>
          <% end %>
          <div class="row-span-1 font-bold text-lg justify-self-center">Ego</div>
        </div>
      </div>
    </div>
    """
  end
end
