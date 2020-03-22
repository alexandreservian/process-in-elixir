defmodule StackSupervisor do
  use Supervisor
  def start_link(_arg \\ []) do
    Supervisor.start_link __MODULE__, :ok, name: __MODULE__
  end
  def init(:ok) do
    children = [ProcessInElixir.StackGenServer, StackDynamicSupervisor]
    Supervisor.init(children, strategy: :one_for_one)
  end
  def count_children(), do: Supervisor.count_children __MODULE__
  def which_children(), do: Supervisor.which_children __MODULE__
  def terminate_process(pid), do: Supervisor.terminate_child __MODULE__, pid
end
