defmodule MausgenWeb.PageLive do
  use MausgenWeb, :live_view

  def mount(_params, _session, socket) do

    {:ok, socket}
  end

  def roll_for_ability() do
    Enum.min([Enum.random(1..6), Enum.random(1..6), Enum.random(1..6)])
  end

  def render(assigns) do
    ~H"""
    <div class="container mx-auto px-10 h-screen py-10 bg-sky-600 grid grid-rows-6">
      <div class="container rounded-lg mx-auto flex justify-center">
        <h1 class="font-mono text-5xl">Generate your brave adventurer...</h1>
      </div>
      <div class="container grid rounded-lg mx-auto">
        <h1 class="font-mono text-3xl row-span-2 justify-self-center">Roll for your ability scores:</h1>
        <div class="grid grid-cols-6 py-10">
          <div class="grid grid-rows-4">
            <div class="row-span-1 font-bold text-lg justify-self-center">Strength</div>
            <button class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black">Roll</button>
          </div>
          <div class="grid grid-rows-4">
            <div class="row-span-1 font-bold text-lg justify-self-center">Dexterity</div>
            <button class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black">Roll</button>
          </div>
          <div class="grid grid-rows-4">
            <div class="row-span-1 font-bold text-lg justify-self-center">Constitution</div>
            <button class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black">Roll</button>
          </div>
          <div class="grid grid-rows-4">
            <div class="row-span-1 font-bold text-lg justify-self-center">Intellect</div>
            <button class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black">Roll</button>
          </div>
          <div class="grid grid-rows-4">
            <div class="row-span-1 font-bold text-lg justify-self-center">Psyche</div>
            <button class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black">Roll</button>
          </div>
          <div class="grid grid-rows-4">
            <div class="row-span-1 font-bold text-lg justify-self-center">Ego</div>
            <button class="w-2/4 justify-self-center rounded-lg row-span-3 bg-cyan-500 hover:bg-cyan-600 border-2 border-black">Roll</button>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
