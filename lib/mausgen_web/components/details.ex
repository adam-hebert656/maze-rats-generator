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
              <span class="font-extrabold text-lg">
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
                <span class="text-lg">Appearance:</span> <%= @character.appearance %>
              </span>
            <% end %>
          </div>
          <div class="col-span-1">
            <%= if @character.phys_detail == nil do %>
              <span class="font-extrabold text-lg">
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
                <span class="text-lg">Physical Detail:</span> <%= @character.phys_detail %>
              </span>
            <% end %>
          </div>
        </div>
        <div class="row-start-2 grid grid-cols-2 col-span-4">
          <div class="col-span-1">
            <%= if @character.background == nil do %>
              <span class="font-extrabold text-lg">
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
                <span class="text-lg">Background:</span> <%= @character.background %>
              </span>
            <% end %>
          </div>
          <div class="col-span-1">
            <%= if @character.clothing == nil do %>
              <span class="font-extrabold text-lg">
                Clothing:
              </span>
              <button
                phx-click="roll_detail"
                value="clothing"
                class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
              >
                Roll
              </button>
            <% else %>
              <span class="font-extrabold">
                <span class="text-lg">Clothing:</span> <%= @character.clothing %>
              </span>
            <% end %>
          </div>
        </div>
      </div>
      <%= if @character.appearance != nil && @character.phys_detail != nil && @character.background != nil && @character.clothing != nil do %>
        <button
          phx-click="next_step"
          class="w-2/4 justify-self-center rounded-lg col-span-3 py-5 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
        >
          Next: Generate a Picture
        </button>
      <% end %>
    </div>
    """
  end
end
