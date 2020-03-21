defmodule ProcessInElixir.StackGenServer do
  use GenServer
  # Server
  def init(stack \\ []), do: {:ok, stack}

  def handle_cast({:push, value}, stack), do: {:noreply, [value | stack]}

  def handle_call(:pop, _from, stack) do
    [head | tail] = stack
    {:reply, head, tail}
  end

  def handle_call(:size, _form, stack), do: {:reply, Enum.count(stack), stack}

  def handle_call(:peek, _from, stack) do
    [head | _tail] = stack
    {:reply, head, stack}
  end

  def handle_call(:isEmpty, _from, stack), do: {:reply, Enum.empty?(stack), stack}

  def handle_call(:clear, _from, _stack), do: {:reply, [], []}

  def handle_call(:show, _form, stack), do: {:reply, Enum.reverse(stack), stack}

  # Client
  def start_link(initialStack \\ []) do
    GenServer.start_link __MODULE__, initialStack, name: __MODULE__
  end

  def push(value), do: GenServer.cast __MODULE__, {:push, value}

  def pop(), do: GenServer.call __MODULE__, :pop

  def size(), do: GenServer.call __MODULE__, :size

  def peek(), do: GenServer.call __MODULE__, :peek

  def isEmpty?(), do: GenServer.call __MODULE__, :isEmpty

  def clear(), do: GenServer.call __MODULE__, :clear

  def show(), do: GenServer.call __MODULE__, :show

end
