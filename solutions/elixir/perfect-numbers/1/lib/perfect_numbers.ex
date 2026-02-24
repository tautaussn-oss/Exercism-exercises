defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}

  def classify(0), do: {:error, "Classification is only possible for natural numbers."}
  def classify(1), do: {:ok, :deficient}
  def classify(number) when number < 0, do: {:error, "Classification is only possible for natural numbers."}
  def classify(number) do
    number
    |> proper_divisors()
    |> Enum.reduce(0, fn x , acc -> acc + x end)
    |> proper(number)
  end

  defp proper_divisors(number) do
  1..(number-1)
  |> Enum.filter(fn x -> rem(number, x) == 0 end)
  end

  defp proper(suma, number) when suma == number, do: {:ok, :perfect}
  defp proper(suma, number) when suma > number, do: {:ok, :abundant}
  defp proper(suma, number) when suma < number, do: {:ok, :deficient}
    
end
