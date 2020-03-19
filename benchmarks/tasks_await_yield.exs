alias ProcessInElixir.Tasks

Benchee.run(%{
  "Tasks.asyncYield/1" => fn -> Tasks.asyncYield 100_000 end,
  "Tasks.asyncAwait/1" => fn -> Tasks.asyncAwait 100_000 end,
  "Factorial.get/1" => fn -> Factorial.get 100_000 end
})
