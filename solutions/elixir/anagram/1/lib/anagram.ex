defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    normalized_base = normalize(base)

    for candidate <- candidates,
        normalize(candidate) == normalized_base,
        String.downcase(candidate) != String.downcase(base) do
      candidate
    end
  end

  defp normalize(word) do
    word
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end
end