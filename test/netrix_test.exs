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

  describe "Tetro.rotate/0" do
    test "shape is rotated 0 to 90" do
      assert Tetro.rotate(%{shape: :i, rotation: 0, position: {5, 1}}) === %{shape: :i, rotation: 90, position: {5, 1}}
    end
    test "rotate shape 90 to 180" do
      assert Tetro.rotate(%{shape: :i, rotation: 90, position: {5, 1}}) === %{shape: :i, rotation: 180, position: {5, 1}}
    end
    test "rotate shape 180 t0 270" do
      assert Tetro.rotate(%{shape: :i, rotation: 180, position: {5, 1}}) === %{shape: :i, rotation: 270, position: {5, 1}}
    end
    test "rotate shape 180 to 270" do
      assert Tetro.rotate(%{shape: :i, rotation: 270, position: {5, 1}}) === %{shape: :i, rotation: 0, position: {5, 1}}
    end
  end
end
