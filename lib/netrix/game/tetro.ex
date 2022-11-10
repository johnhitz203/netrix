defmodule Netrix.Game.Tetro do
  defstruct shape: :z, rotation: 0, position: {5, 1}

  def new do
    __struct__(shape: random_shape())
  end

  defp random_shape do
    ~w[l i j s z o t]a
    |> Enum.random()
  end

  def right(%{position: {x, y}} = tetro) do
    %{tetro | position: {x + 1, y}}
  end

  def left(%{position: {x, y}} = tetro) do
    %{tetro | position: {x - 1, y}}
  end

  def down(%{position: {x, y}} = tetro) do
    %{tetro | position: {x, y + 1}}
  end

  def rotate() do
    "i'm a homework"
  end

    def to_points(%{shape: :i} = tetro) do
    %{position: {x, y} = p} = tetro
    [{x - 2, y}, {x - 1, y}, p, {x + 1, y}]
  end

end
