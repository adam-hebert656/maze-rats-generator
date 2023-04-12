defmodule MausgenWeb.Items do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="container grid rounded-lg mx-auto">
      <h1 class="font-mono text-3xl row-span-2 justify-self-center">
        Roll Your Items:
      </h1>
      <div class="grid grid-rows-6 grid-cols-1 py-10">
        <div class="row-span-1 flex justify-center">
          <%= if Enum.at(@character.items, 0) == nil do %>
            <button
              phx-click="roll_item"
              value="0"
              class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              First Item
            </button>
          <% else %>
            <span class="font-extrabold">
              <%= Enum.at(@character.items, 0) %>
            </span>
          <% end %>
        </div>
        <div class="row-span-1 flex justify-center">
          <%= if Enum.at(@character.items, 1) == nil do %>
            <button
              phx-click="roll_item"
              value="1"
              class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Second Item
            </button>
          <% else %>
            <span class="font-extrabold">
              <%= Enum.at(@character.items, 1) %>
            </span>
          <% end %>
        </div>
        <div class="row-span-1 flex justify-center">
          <%= if Enum.at(@character.items, 2) == nil do %>
            <button
              phx-click="roll_item"
              value="2"
              class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Third Item
            </button>
          <% else %>
            <span class="font-extrabold">
              <%= Enum.at(@character.items, 2) %>
            </span>
          <% end %>
        </div>
        <div class="row-span-1 flex justify-center">
          <%= if Enum.at(@character.items, 3) == nil do %>
            <button
              phx-click="roll_item"
              value="3"
              class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Fourth Item
            </button>
          <% else %>
            <span class="font-extrabold">
              <%= Enum.at(@character.items, 3) %>
            </span>
          <% end %>
        </div>
        <div class="row-span-1 flex justify-center">
          <%= if Enum.at(@character.items, 4) == nil do %>
            <button
              phx-click="roll_item"
              value="4"
              class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Fifth Item
            </button>
          <% else %>
            <span class="font-extrabold">
              <%= Enum.at(@character.items, 4) %>
            </span>
          <% end %>
        </div>
        <div class="row-span-1 flex justify-center">
          <%= if Enum.at(@character.items, 5) == nil do %>
            <button
              phx-click="roll_item"
              value="5"
              class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
            >
              Sixth Item
            </button>
          <% else %>
            <span class="font-extrabold">
              <%= Enum.at(@character.items, 5) %>
            </span>
          <% end %>
        </div>
      </div>
      <%= if !Enum.member?(@character.items, nil) do %>
        <button
          phx-click="next_step"
          class="w-2/4 justify-self-center rounded-lg py-5 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
        >
          Next: Roll for Character Details
        </button>
      <% end %>
    </div>
    """
  end
end
