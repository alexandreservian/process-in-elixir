defmodule Factorial do
  def get(0), do: 1
  def get(1), do: 1
  def get(number) when is_integer(number) do
    number * get number - 1
  end
end
