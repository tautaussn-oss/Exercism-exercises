defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    extract_helper(data, String.split(path, "."))
  end

  defp extract_helper(data, []), do: data
  defp extract_helper(data, [x | xs]), do: extract_helper(data[x], xs)

  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
