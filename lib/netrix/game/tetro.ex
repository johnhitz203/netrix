defmodule Netrix.Game.Tetro do
  defstruct shape: :z, rotation: 90, position: {5, 1}

  def new do
    __struct__(shape: random_shape())
  end

  defp random_shape do
    # ~w[l i j s z o t]a
    ~w[i]a
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

  def rotate(%{rotation: rotation} = tetro) when rotation < 270 do
    %{tetro | rotation: tetro.rotation + 90}
  end

  def rotate(%{rotation: rotation} = tetro) when rotation === 270 do
    %{tetro | rotation: 0}
  end

  def to_points(%{shape: :i} = tetro) do
    os = get_offset(tetro)
    %{position: {x, y}} = tetro
    px = x + os
    [{px - 2, y}, {px - 1, y}, {px, y}, {px + 1, y}]
  end

  defp get_offset(%{shape: shape, position: {x, _y}, rotation: r}) when shape === :i and r === 0 do
    cond do
      x === 2 -> 1
      x === 1 -> 2
      x >= 3 -> 0
    end
  end

end
