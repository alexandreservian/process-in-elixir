defmodule Weather do
  @appid "b662704a880a3603e0adad895bcb098c"
  def getEndPoint(city) do
     cityEncoded = URI.encode city
     "http://api.openweathermap.org/data/2.5/weather?q=#{cityEncoded}&appid=#{@appid}"
  end

  def getTemperatureInCelsius(city) do
    city
      |> getEndPoint
      |> HTTPoison.get
      |> parserResponse
  end

  def parserResponse({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body
    |> JSON.decode
    |> computeTemperature
  end
  def parserResponse({:ok, %HTTPoison.Response{status_code: 404}}), do: "city not found"
  def parserResponse(_), do: raise "Error in parserResponse"

  def computeTemperature({:ok, %{"main" => %{"temp" => temp}}}), do: temp |> kelvinTocelsius
  def computeTemperature(_), do: raise ArgumentError, message: "Map should contain main => temp"

  def kelvinTocelsius(kelvin) when is_number(kelvin), do: (kelvin - 273.15) |> Float.round(1)

end
