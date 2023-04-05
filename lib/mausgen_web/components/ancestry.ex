defmodule MausgenWeb.Ancestry do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="container grid rounded-lg mx-auto">
      <h1 class="font-mono text-3xl row-span-2 justify-self-center">
        Choose an Ancestry:
      </h1>
      <div class="grid grid-cols-5 py-10">
        Test
      </div>
    </div>
    """
  end
end
