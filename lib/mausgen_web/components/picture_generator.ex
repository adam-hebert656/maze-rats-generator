defmodule MausgenWeb.PictureGenerator do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="container grid grid_cols-6 justify-center rounded-lg mx-auto">
      <h1 class="font-mono text-3xl col-span-2 row-span-2 justify-self-center">
        Choose an image for your Maze Rat:
      </h1>
      <div class="col-span-4 grid grid-cols-4 grid-rows-2 py-10">
        <%= if @generated_images == nil do %>
          <button
            phx-click="generate_images"
            class="w-2/4 justify-self-center rounded-lg col-span-4 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
          >
            Generate Images
          </button>
        <% else %>
          <div class="col-span-4 row-span-1 flex">
            <img src={Enum.at(@generated_images, 0)} phx-click="choose_image" phx-value-url={Enum.at(@generated_images, 0)}>
            <img src={Enum.at(@generated_images, 1)} phx-click="choose_image" phx-value-url={Enum.at(@generated_images, 1)}>
            <img src={Enum.at(@generated_images, 2)} phx-click="choose_image" phx-value-url={Enum.at(@generated_images, 2)}>
            <img src={Enum.at(@generated_images, 3)} phx-click="choose_image" phx-value-url={Enum.at(@generated_images, 3)}>
          </div>
          <button
            phx-click="generate_images"
            class="w-2/4 justify-self-center rounded-lg col-span-4 row-span-1 bg-cyan-500 hover:bg-cyan-600 border-2 border-black"
          >
            Re-generate Images
          </button>
        <% end %>
      </div>
      <%= if @character.image != nil do %>
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
