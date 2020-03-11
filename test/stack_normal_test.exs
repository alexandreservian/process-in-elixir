defmodule ProcessInElixirTest.Stack do
  use ExUnit.Case, async: true
  doctest ProcessInElixir
  alias ProcessInElixir.StackNormal

  setup do
    {:ok, pid} = StackNormal.start_link
    %{pid: pid}
  end

  describe "StackNormal" do
    test "StackNormal.start_link: should be :ok and pid", %{pid: pid} do
      assert is_pid(pid)
    end

    test "StackNormal.push: should be size 4 after 4 call method push", %{pid: pid} do
      StackNormal.push pid, 5
      StackNormal.push pid, 7
      StackNormal.push pid, 9
      StackNormal.push pid, 3
      assert StackNormal.size(pid) == 4
    end

    test "StackNormal.pop: should remove last element it's 27", %{pid: pid} do
      StackNormal.push pid, 15
      StackNormal.push pid, 50
      StackNormal.push pid, 27
      assert StackNormal.pop(pid) == 27
    end

    test "StackNormal.size: should return 2", %{pid: pid} do
      StackNormal.push pid, 15
      StackNormal.push pid, 50
      assert StackNormal.size(pid) == 2
    end

    test "StackNormal.peek: should return 50", %{pid: pid} do
      StackNormal.push pid, 78
      StackNormal.push pid, 50
      assert StackNormal.peek(pid) == 50
    end

    test "StackNormal.isEmpty?: should return true", %{pid: pid} do
      assert StackNormal.isEmpty?(pid) == true
    end

    test "StackNormal.isEmpty?: should return false", %{pid: pid} do
      StackNormal.push pid, 19
      assert StackNormal.isEmpty?(pid) == false
    end

    test "StackNormal.clear: should return []", %{pid: pid} do
      StackNormal.push pid, 17
      StackNormal.push pid, 13
      assert StackNormal.clear(pid) == []
    end

    test "StackNormal.show: should be [15,17]", %{pid: pid} do
      StackNormal.push pid, 15
      StackNormal.push pid, 17
      assert StackNormal.show(pid) == [15,17]
    end
  end
end
