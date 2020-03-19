alias ProcessInElixir.Tasks

range = 1..1000

Benchee.run(%{
  "Tasks.asyncStream/2 4 process" => fn -> Tasks.asyncStream range end,
  "Tasks.asyncStream/2 8 process" => fn -> Tasks.asyncStream range, 2 end,
  "Tasks.asyncStream/2 12 process" => fn -> Tasks.asyncStream range, 3 end,
  "Tasks.asyncStream/2 150 process" => fn -> Tasks.asyncStream range, 50 end,
  "Enum.map" => fn -> Enum.map range, fn i ->
      Factorial.get i
    end
  end
})
