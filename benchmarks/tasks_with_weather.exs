cities = ["goiania", "rio verde", "jatai", "florianopolis", "sao paulo", "rio de janeiro"]

asyncStream = fn(cities, moreSchedulers) ->
  max_concurrency = System.schedulers_online() * moreSchedulers
  cities
      |> Task.async_stream(fn city -> {city, Weather.getTemperatureInCelsius city} end, max_concurrency: max_concurrency, timeout: :infinity)
      |> Enum.map(fn {:ok, res} -> res end)
end

Benchee.run(%{
  "Tasks.asyncStream 4 process" => fn -> asyncStream.(cities, 1) end,
  "Tasks.asyncStream 8 process" => fn -> asyncStream.(cities, 2) end,
  "Enum.map" => fn ->
      cities
        |> Enum.map(fn city -> {city, Weather.getTemperatureInCelsius city} end)
    end
})
