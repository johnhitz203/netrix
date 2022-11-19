defmodule Netrix.Utils.StringTest do
  use ExUnit.Case
  alias String.Chars.Shape

  # import String.Chars.Shape

  describe "to_string/1" do
    test Shape.to_string(%{shape: :i}) do
      assert [{2, 2}, {3, 2}, {3, 3}, {4, 3}]
    end
  end
end
