defmodule Netrix.Game.Tetro do
  defstruct shape: :z, rotation: 90, position: {5, 1}

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

  def rotate(%{rotation: rotation} = tetro) when rotation < 270 do
    %{tetro | rotation: tetro.rotation + 90}
  end

  def rotate(%{rotation: rotation} = tetro) when rotation === 270 do
    %{tetro | rotation: 0}
  end

  def to_points(%{shape: :i}) do
   [
      {2, 1},
      {2, 2},
      {2, 3},
      {2, 4}
    ]
  end

  def to_points(%{shape: :j}) do
    [
             {3, 1},
             {3, 2},
      {2, 3},{3, 3},
    ]
  end

  def to_points(%{shape: :l}) do
    [
      {2, 1},
      {2, 2},
      {2, 3},{3, 3}
    ]
  end

  def to_points(%{shape: :o}) do
    [
      {2, 2}, {2, 3},
      {3, 2}, {3, 3}
    ]
  end

  def to_points(%{shape: :s}) do
    [         {2, 2}, {3, 2},
      {1, 3}, {2, 3}
    ]
  end

  def to_points(%{shape: :t}) do
    [
      {2, 2}, {3, 2}, {4, 2},
              {3, 3}
    ]
  end

  def to_points(%{shape: :z}) do
    [
      {2, 2}, {3, 2},
             {3, 3}, {4, 3}
    ]
  end
end
