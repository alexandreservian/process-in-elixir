Benchee.run(%{
  "Enum.map/2" => fn -> Enum.map(1..10000, fn item -> item * 2 end) end,
  "Task.async_stream/3" => fn ->
    Task.async_stream(1..10000, fn item -> item * 2 end)
    |> Enum.into([], fn {:ok, res} -> res end)
  end
})
