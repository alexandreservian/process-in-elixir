defmodule ProcessInElixirTest.StackAgent do
  use ExUnit.Case, async: true
  doctest ProcessInElixir
  alias ProcessInElixir.StackAgent

  setup do
    {:ok, pid} = StackAgent.start_link
    %{pid: pid}
  end

  describe "StackAgent" do
    test "StackAgent.start_link: should be :ok and pid", %{pid: pid} do
      assert is_pid(pid)
    end

    test "StackAgent.push: should be size 4 after 4 call method push", %{pid: pid} do
      StackAgent.push pid, 5
      StackAgent.push pid, 7
      StackAgent.push pid, 9
      StackAgent.push pid, 3
      assert StackAgent.size(pid) == 4
    end

    test "StackAgent.pop: should remove last element it's 27", %{pid: pid} do
      StackAgent.push pid, 15
      StackAgent.push pid, 50
      StackAgent.push pid, 27
      assert StackAgent.pop(pid) == 27
    end

    test "StackAgent.size: should return 2", %{pid: pid} do
      StackAgent.push pid, 15
      StackAgent.push pid, 50
      assert StackAgent.size(pid) == 2
    end

    test "StackAgent.peek: should return 50", %{pid: pid} do
      StackAgent.push pid, 78
      StackAgent.push pid, 50
      assert StackAgent.peek(pid) == 50
    end

    test "StackAgent.isEmpty?: should return true", %{pid: pid} do
      assert StackAgent.isEmpty?(pid) == true
    end

    test "StackAgent.isEmpty?: should return false", %{pid: pid} do
      StackAgent.push pid, 19
      assert StackAgent.isEmpty?(pid) == false
    end

    test "StackAgent.clear: should return []", %{pid: pid} do
      StackAgent.push pid, 17
      StackAgent.push pid, 13
      assert StackAgent.clear(pid) == []
    end

    test "StackAgent.show: should be [15,17]", %{pid: pid} do
      StackAgent.push pid, 15
      StackAgent.push pid, 17
      assert StackAgent.show(pid) == [15,17]
    end
  end
end
