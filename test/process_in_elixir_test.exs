defmodule ProcessInElixirTest do
  use ExUnit.Case
  doctest ProcessInElixir

  test "greets the world" do
    assert ProcessInElixir.hello() == :world
  end
end
