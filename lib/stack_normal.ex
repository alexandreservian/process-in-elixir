defmodule ProcessInElixir.StackNormal do
  def start_link(initialStack \\ []) do
    pid = spawn_link __MODULE__, :loop, [initialStack]
    {:ok, pid}
  end

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]},
      type: :worker,
      restart: :permanent,
      shutdown: 500
    }
  end

  def loop(stack \\ []) do
    receive do
      {:push, value} ->
        newStack = [value | stack]
        loop newStack
      {:pop, sender} ->
        [head | tail] = stack
        send sender, {:ok, head}
        loop tail
      {:size, sender} ->
        send sender, {:ok, Enum.count stack}
      {:peek, sender} ->
        [head | _tail] = stack
        send sender, {:ok, head}
      {:isEmpty, sender} ->
        send sender, {:ok, Enum.empty? stack}
      {:clear, sender} ->
        send sender, {:ok, []}
        loop []
      {:show, sender} ->
        send sender, {:ok, Enum.reverse stack}
    end
    loop stack
  end

  def push(pid, value) do
    send pid, {:push, value}
  end
  def pop(pid) do
    send pid, {:pop, self()}
    receive do {:ok, itemDeleted} -> itemDeleted end
  end
  def size(pid) do
    send pid, {:size, self()}
    receive do {:ok, size} -> size end
  end
  def peek(pid) do
    send pid, {:peek, self()}
    receive do {:ok, lastItem} -> lastItem end
  end
  def isEmpty?(pid) do
    send pid, {:isEmpty, self()}
    receive do {:ok, isEmpty} -> isEmpty end
  end
  def clear(pid)do
    send pid, {:clear, self()}
    receive do {:ok, stack} -> stack end
  end
  def show(pid) do
    send pid, {:show, self()}
    receive do {:ok, stack} -> stack end
  end
end
