defmodule ProcessInElixir.BookAgent do
  use Agent
  def start_link(initialValue \\ %{}) do
    Agent.start_link fn -> initialValue end, name: __MODULE__
  end

  def get(author) do
    Agent.get __MODULE__, fn state -> state[author] end
  end

  def getAll do
    Agent.get __MODULE__, fn state -> state end
  end

  def put(author, books) do
    Agent.update __MODULE__, fn state ->
      Map.put state, author, books
    end
  end

end
