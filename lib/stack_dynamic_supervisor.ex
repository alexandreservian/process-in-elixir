defmodule StackDynamicSupervisor do
  use DynamicSupervisor

  def start_link(_arg \\ []) do
    DynamicSupervisor.start_link __MODULE__, :ok, name: __MODULE__
  end

  def start_process(process) do
    DynamicSupervisor.start_child __MODULE__, process
  end

  def init(:ok), do: DynamicSupervisor.init(strategy: :one_for_one)
  def count_children(), do: DynamicSupervisor.count_children __MODULE__
  def which_children(), do: DynamicSupervisor.which_children __MODULE__
  def terminate_process(pid), do: DynamicSupervisor.terminate_child __MODULE__, pid
end
