defmodule ProcessInElixirTest.StackGenServer do
  use ExUnit.Case, async: true
  doctest ProcessInElixir
  alias ProcessInElixir.StackGenServer

  describe "StackGenServer" do
    test "StackGenServer.start_link: should return a pid" do
      {:ok, pid} = StackGenServer.start_link
      assert is_pid(pid)
    end

    test "StackGenServer.push: should be size 4 after 4 call method push" do
      StackGenServer.start_link
      StackGenServer.push 5
      StackGenServer.push 7
      StackGenServer.push 9
      StackGenServer.push 3
      assert StackGenServer.size() == 4
    end

    test "StackGenServer.pop: should remove last element it's 27" do
      StackGenServer.start_link
      StackGenServer.push 15
      StackGenServer.push 50
      StackGenServer.push 27
      assert StackGenServer.pop() == 27
    end

    test "StackGenServer.size: should return 2" do
      StackGenServer.start_link
      StackGenServer.push 15
      StackGenServer.push 50
      assert StackGenServer.size() == 2
    end

    test "StackGenServer.peek: should return 50" do
      StackGenServer.start_link
      StackGenServer.push 78
      StackGenServer.push 50
      assert StackGenServer.peek() == 50
    end

    test "StackGenServer.isEmpty?: should return true" do
      StackGenServer.start_link
      assert StackGenServer.isEmpty?() == true
    end

    test "StackGenServer.isEmpty?: should return false" do
      StackGenServer.start_link
      StackGenServer.push 19
      assert StackGenServer.isEmpty?() == false
    end

    test "StackGenServer.clear: should return []" do
      StackGenServer.start_link
      StackGenServer.push 17
      StackGenServer.push 13
      assert StackGenServer.clear() == []
    end

    test "StackGenServer.show: should be [15,17]" do
      StackGenServer.start_link
      StackGenServer.push 15
      StackGenServer.push 17
      assert StackGenServer.show() == [15,17]
    end
  end
end
