defmodule MausgenWeb.Sheet do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="container grid grid_cols-6 justify-center rounded-lg mx-auto">
      <h1 class="font-mono text-3xl col-span-2 row-span-2 justify-self-center">
        Here's your Maze Rat, <%= @character.name %>
      </h1>
      <div class="col-span-6 flex justify-center py-10">
        <div>
          <img src={@character.image} class="px-5">
        </div>
        <div class="flex flex-col">
          <div><span class="font-bold">STR: </span>+ <%= @character.str %></div>
          <div><span class="font-bold">DEX: </span>+ <%= @character.dex %></div>
          <div><span class="font-bold">WILL: </span>+ <%= @character.will %></div>
          <div><span class="font-bold">HP: </span>4</div>
          <div><span class="font-bold">Level: </span>1</div>
          <div><span class="font-bold">Feature: </span><%= @character.feature %></div>
          <div><span class="font-bold">Appearance: </span><%= @character.appearance %></div>
          <div><span class="font-bold">Physical Detail: </span><%= @character.phys_detail %></div>
          <div><span class="font-bold">Background: </span><%= @character.background %></div>
          <div><span class="font-bold">Clothing: </span><%= @character.clothing %></div>
          <div><span class="font-bold">Items: </span><%= Enum.join(@character.items, ", ") %></div>
        </div>
      </div>
    </div>
    """
  end
end
