defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

    iex> RnaTranscription.to_rna(~c"ACTG")
    ~c"UGAC"
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
  dna
  |> Enum.map(fn
    ?C -> ?G
    ?G -> ?C
    ?A -> ?U
    ?T -> ?A
  end)
    

  end
end
