defmodule NetrixTestGame do
  use ExUnit.Case

  alias Mix.Task
  alias Netrix.Game.Tetro

  describe "Tetro.to_points/1" do
    test "to_points for :i" do
      assert Tetro.to_points(%{shape: :i}) do
        [
          {2, 1},
          {2, 2},
          {2, 3},
          {2, 4}
        ]
      end
    end

    test "to_points for :j" do
      assert Tetro.to_points(%{shape: :j}) do
        [
          {3, 1},
          {3, 2},
          {2, 3},
          {3, 3}
        ]
      end
    end

    test "to_points for :l" do
      assert Tetro.to_points(%{shape: :l}) do
        [
          {2, 1},
          {2, 2},
          {2, 3},
          {3, 3}
        ]
      end
    end

    test "to_points for :o" do
      assert Tetro.to_points(%{shape: :o}) do
        [
          {2, 2},
          {2, 3},
          {3, 2},
          {3, 3}
        ]
      end
    end

    test "to_points for :s" do
      assert Tetro.to_points(%{shape: :s}) do
        [{2, 2}, {3, 2}, {1, 3}, {2, 3}]
      end
    end

    test "to_points for :t" do
      assert Tetro.to_points(%{shape: :t}) do
        [
          {2, 2},
          {3, 2},
          {4, 2},
          {3, 3}
        ]
      end
    end

    test "to_points for :z" do
      assert Tetro.to_points(%{shape: :z}) do
        [
          {2, 2},
          {3, 2},
          {3, 3},
          {4, 3}
        ]
      end
    end
  end

  describe "Tetro.to_string/1" do
    test "success: accepts a tetro and returns a string representation" do
      # tetro = %Netrix.Game.Tetro{shape: :i, rotation: 90, position: {5, 1}}
      tetro = Tetro.new(:i)
      assert ".$..\n.$..\n.$..\n.$..\n" = to_string(tetro)
    end
  end
end
