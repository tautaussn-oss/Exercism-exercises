defmodule Hamming do
 
  def dist_helper([], []), do: 0
  def dist_helper([head1 | tail1], [head2 | tail2]) when head1 == head2 do
    dist_helper(tail1, tail2)
  end
  def dist_helper([head1 | tail1], [head2 | tail2]) when head1 != head2 do
    1 + dist_helper(tail1, tail2)
  end
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(list1, list2) when length(list1) > length(list2) or length(list1) < length(list2) do 
    {:error, "strands must be of equal length"}
  end
  def hamming_distance(list1, list2) do
    {:ok, dist_helper(list1, list2)}
  end
end
