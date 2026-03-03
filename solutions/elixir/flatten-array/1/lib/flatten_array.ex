defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1, 2, 3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    lista = not_nil(list)
    pomocna(lista)
  end

  defp pomocna([]), do: []
  defp pomocna([head | tail]) do
    pomocna(head) ++ pomocna(tail)
  end
  defp pomocna(nil), do: []
  defp pomocna(element), do: [element]

  #def flatten([]), do: []

 # def flatten([head | tail]) do
 #   flatten(head) ++ flatten(tail)
 # end

 # def flatten(nil), do: []

 # def flatten(element), do: [element]
  
  defp not_nil(list) do
    Enum.filter(list, fn x -> x != nil end)
  end
end
