defmodule NetrixTestGame do
  use ExUnit.Case

  alias Netrix.Game.Tetro

  describe "Tetro.to_points/1" do
    test "to_points for :i" do
      assert Tetro.to_points(%{shape: :i}) ==
               [
                 {2, 1},
                 {2, 2},
                 {2, 3},
                 {2, 4}
               ]
    end

    test "to_points for :j" do
      assert Tetro.to_points(%{shape: :j}) ==
               [
                 {3, 1},
                 {3, 2},
                 {2, 3},
                 {3, 3}
               ]
    end

    test "to_points for :l" do
      assert Tetro.to_points(%{shape: :l}) ==
               [
                 {2, 1},
                 {2, 2},
                 {2, 3},
                 {3, 3}
               ]
    end

    test "to_points for :o" do
      assert Tetro.to_points(%{shape: :o}) ==
               [
                 {2, 2},
                 {2, 3},
                 {3, 2},
                 {3, 3}
               ]
    end

    test "to_points for :s" do
      assert Tetro.to_points(%{shape: :s}) ==
               [{2, 2}, {3, 2}, {1, 3}, {2, 3}]
    end

    test "to_points for :t" do
      assert Tetro.to_points(%{shape: :t}) ==
               [
                 {2, 2},
                 {3, 2},
                 {4, 2},
                 {3, 3}
               ]
    end

    test "to_points for :z" do
      assert Tetro.to_points(%{shape: :z}) ==
               [
                 {2, 2},
                 {3, 2},
                 {3, 3},
                 {4, 3}
               ]
    end
  end

  describe "to_string(%Tetro{})" do
    letter_to_output = [
      {:l, ".█..\n.█..\n.██.\n....\n"},
      {:i, ".█..\n.█..\n.█..\n.█..\n"},
      {:j, "..█.\n..█.\n.██.\n....\n"},
      {:s, "....\n.██.\n██..\n....\n"},
      {:z, "....\n.██.\n..██\n....\n"},
      {:o, "....\n.██.\n.██.\n....\n"},
      {:t, "....\n.███\n..█.\n....\n"}
    ]

    for {letter, expected_string} <- letter_to_output do
      test "success: returns a string representation for #{inspect(letter)}" do
        letter = unquote(letter)
        expected_string = unquote(expected_string)
        tetro = Tetro.new(letter)
        result = to_string(tetro)

        assert result == expected_string,
               "output for tetro incorrect\nshape: #{letter}\nexpected:\n#{expected_string}\ngot:\n#{inspect(result)}"
      end
    end
  end
end
