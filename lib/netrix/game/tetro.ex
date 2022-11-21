defmodule Netrix.Game.Tetro do

  alias Netrix.Game.Tetro

  defstruct shape: :z, rotation: 90, position: {5, 1}

  def new do
    __struct__(shape: random_shape())
  end

  def new(shape) do
    __struct__(shape: shape)
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

  defimpl String.Chars, for: Tetro do
    def to_string(tetro) do
      _output =
        tetro
        |> Tetro.to_points()
        |> to_list_of_strings()
        |> return_string()
    end

    defp to_list_of_strings(list_of_points) do
      for y <- 1..4 do
        for x <- 1..4, into: "" do
          if {x, y}  in list_of_points do
            "$"
          else
            "."
          end
        end
      end
    end

    defp return_string(list_of_strings) do
      for string <- list_of_strings, into: "" do
        "#{string}\n"
      end
    end


  end
end
