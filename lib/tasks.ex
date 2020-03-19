defmodule ProcessInElixir.Tasks do
  def asyncAwait(number) do
    task = Task.async fn -> Factorial.get number end
    Task.await task, :infinity
  end
  def asyncYield(number) do
    task = Task.async fn -> Factorial.get number end
    Task.yield task, :infinity
  end
  def asyncStream(range, moreSchedulers \\ 1) when is_map(range) do
    max_concurrency = System.schedulers_online() * moreSchedulers
    range
      |> Task.async_stream(fn i -> Factorial.get i end, timeout: :infinity, max_concurrency: max_concurrency)
      |> Enum.map(fn {:ok, i} -> i end)
  end
end
