defmodule ProcessInElixir.StackAgent do
  def start_link do
    Agent.start_link fn -> [] end
  end

  def push(pid, value) do
    Agent.update pid, &([value | &1])
  end
  def pop(pid) do
    currentStack = show pid
    [head | _tail] = Enum.reverse currentStack
    Agent.update pid, fn state ->
      [_head | tail] = state
      tail
    end
    head
  end
  def size(pid) do
    Agent.get pid, &(Enum.count &1)
  end
  def peek(pid) do
    Agent.get pid, fn state ->
      [head | _tail] = state
      head
    end
  end
  def isEmpty?(pid) do
    currentStack = show pid
    Enum.empty? currentStack
  end
  def clear(pid)do
    Agent.update pid, fn _state -> [] end
    []
  end
  def show(pid) do
    Agent.get pid, &(Enum.reverse &1)
  end
end
