defmodule FactorialTest do
  use ExUnit.Case, async: true
  doctest Factorial
  import Factorial

  describe "Factorial" do
    test "should return 2 if it's 2" do
      assert get(2) == 2
    end
    test "should return 6 if it's 3" do
      assert get(3) == 6
    end
    test "should return 1 if it's 0" do
      assert get(0) == 1
    end
  end
end
