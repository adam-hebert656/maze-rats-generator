defmodule MausgenWeb.Details do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="container grid grid_cols-6 justify-center rounded-lg mx-auto">
      <h1 class="font-mono text-3xl col-span-2 row-span-2 justify-self-center">
        Roll for your Maze Rat's details:
      </h1>
      <div class="col-span-4 grid grid-cols-4 grid-rows-3 py-10">
        <div class="row-start-1 grid grid-cols-2 col-span-4">
          <div class="col-span-1">
            <%= if @character.appearance == nil do %>
              <span class="font-extrabold">
                Appearance:
              </span>
              <button
                phx-click="roll_detail"
                value="appearance"
                class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
              >
                Roll
              </button>
            <% else %>
              <span class="font-extrabold">
                Appearance: <%= @character.appearance %>
              </span>
            <% end %>
          </div>
          <div class="col-span-1">
            <%= if @character.phys_detail == nil do %>
              <span class="font-extrabold">
                Physical Detail:
              </span>
              <button
                phx-click="roll_detail"
                value="phys_detail"
                class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
              >
                Roll
              </button>
            <% else %>
              <span class="font-extrabold">
                Physical Detail: <%= @character.phys_detail %>
              </span>
            <% end %>
          </div>
        </div>
        <div class="row-start-2 grid grid-cols-2 col-span-4">
          <div class="col-span-1">
            <%= if @character.background == nil do %>
              <span class="font-extrabold">
                Background:
              </span>
              <button
                phx-click="roll_detail"
                value="background"
                class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
              >
                Roll
              </button>
            <% else %>
              <span class="font-extrabold">
                Background: <%= @character.background %>
              </span>
            <% end %>
          </div>
          <div class="col-span-1">test</div>
        </div>
        <div class="row-start-3 grid grid-cols-2 col-span-4">
          <div class="col-span-1">test</div>
          <div class="col-span-1">test</div>
        </div>
      </div>
      <%= if @character.str != nil && @character.dex != nil && @character.will != nil do %>
        <button
          phx-click="next_step"
          class="w-2/4 justify-self-center rounded-lg col-span-3 py-5 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
        >
          Next: Generate a Picture & Backstory
        </button>
      <% end %>
    </div>
    """
  end
end
