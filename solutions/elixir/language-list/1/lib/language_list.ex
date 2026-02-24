defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
    
  end

  def remove([_head | tail]), do: tail
  def remove([]), do: []


  def first([head | _tail]), do: head
  def first([]), do: []

  def count(list) do
    length(list)
  end

  def functional_list?(list) do
    allowed = ["Elixir", "Erlang"]
    Enum.any?(list, fn lang -> Enum.member?(allowed, lang)
end)
  end
end
