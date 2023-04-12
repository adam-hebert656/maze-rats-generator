defmodule MausgenWeb.Features do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="container grid rounded-lg mx-auto">
      <h1 class="font-mono text-3xl row-span-2 justify-self-center">
        Choose a Starting Feature:
      </h1>
      <div class="grid grid-rows-2 grid-cols-1 py-10">
        <div class="row-span-1 flex justify-center">
          <button
            phx-click="choose_feature"
            value="+1 Attack Bonus"
            class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
          >
            +1 Attack Bonus
          </button>
        </div>
        <div class="row-span-1 flex justify-center">
          <button
            phx-click="choose_feature"
            value="A Single Spell Slot"
            class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
          >
            A Single Spell Slot
          </button>
        </div>
      </div>
    </div>
    """
  end
end
