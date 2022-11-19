defimpl String.Chars, for: Shape do
  alias Netrix.Game.Tetro
  def to_string(shape) do
    interior =
      shape
      |> Tetro.to_points()
      |> to_chars()
      |> join_chars()

    "#{interior}"
  end

  defp to_chars(list_of_points) do
    Enum.map(1..4, fn(x) ->
      Enum.map(1..4, fn(y) ->
        if {x, y} in list_of_points do
          "$"
        else
          "."
        end
      end)
    end)
  end

  def join_chars(list) do
    list
    |> Enum.map(fn(r) ->
      Enum.join(r, "")
    end)
  end
end

# defmodule Netrix.Utils.Stringify do
#   def to_chars(shape) do
#     Enum.map(1..4, fn(x) ->
#       Enum.map(1..4,fn(y) ->
#         if {x, y} in shape do
#           "$"
#         else
#           "."
#         end
#       end)
#     end)
#   end

#   def join_chars(lists) do
#       lists
#       |> Enum.map(fn(r) ->
#             Enum.join(r, "")
#           end)
#       |> Enum.join("\n")
#   end
# end
