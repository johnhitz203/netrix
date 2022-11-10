defmodule NetrixTest do
  use ExUnit.Case

  alias Netrix.Game.{ManipulateTetro, Tetro}

  describe "Tetro.to_points/1" do
    test "points are returned" do
      assert Tetro.to_points(%{shape: :i, rotation: 0, position: {5, 1}}) === [{3,1}, {4, 1}, {5, 1}, {6, 1}]
      assert Tetro.to_points(%{shape: :i, rotation: 0, position: {3, 1}}) === [{1,1}, {2, 1}, {3, 1}, {4, 1}]
      assert Tetro.to_points(%{shape: :i, rotation: 0, position: {2, 1}}) === [{1,1}, {2, 1}, {3, 1}, {4, 1}]
    end
  end



  # describe "shift/1" do
  #   test ":i with 0 rotation at {5, 1}" do

  #   end
  # end
end
