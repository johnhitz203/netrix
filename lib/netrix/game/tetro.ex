defmodule Netrix.Game.Tetro do
  defstruct [shape: :z, rotation: 0, position: {5,1}]

  def new do
    __struct__(shape: random_shape())
  end

  defp random_shape do
    ~w[l i j s z o t]a
    |> Enum.random()
  end
end
