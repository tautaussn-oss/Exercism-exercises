defmodule Scrabble do
  @value 0
  @jedan  ["a", "e", "i", "o", "u", "l", "n","r","s","t"]
  @dva  ["d", "g"]
  @tri  ["b", "c", "m", "p"]
  @cetiri  ["f", "h", "v","w","y"]
  @pet  ["k"]
  @osam  ["j", "x"]
  @deset  ["q", "z"]
  
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
  value = 0
  rez = [word, value]
  [rijec, rezultat] =
  rez
  |> jedan()
  |> dva()
  |> tri()
  |> cetiri()
  |> pet()
  |> osam()
  |> deset()

  rezultat

  

  
  
  end

  def jedan([word, value]) do
    words = 
    word
    |> String.downcase()
    |> String.graphemes()

    value_nova = value + Enum.count(words, fn x -> x in @jedan end )
    [word, value_nova]
  
  end

   def dva([word, value]) do
    words = 
    word
    |> String.downcase()
    |> String.graphemes()

    value_nova = value + (Enum.count(words, fn x -> x in @dva end )) * 2
    [word, value_nova]
  
  end
   def tri([word,value]) do
    words = 
    word
    |> String.downcase()
    |> String.graphemes()

    value_nova = value + (Enum.count(words, fn x -> x in @tri end ))*3
    [word, value_nova]
  
  end
   def cetiri([word, value]) do
    words = 
    word
    |> String.downcase()
    |> String.graphemes()

    value_nova = value + (Enum.count(words, fn x -> x in @cetiri end )) * 4
    [word, value_nova]
  
  end
   def pet([word, value]) do
    words = 
    word
    |> String.downcase()
    |> String.graphemes()

    value_nova = value + (Enum.count(words, fn x -> x in @pet end )) * 5
    [word, value_nova]
  
  end
   def osam([word, value]) do
    words = 
    word
    |> String.downcase()
    |> String.graphemes()

    value_nova = value + (Enum.count(words, fn x -> x in @osam end )) * 8
    [word, value_nova]
  
  end
   def deset([word, value]) do
    words = 
    word
    |> String.downcase()
    |> String.graphemes()

    value_nova = value + (Enum.count(words, fn x -> x in @deset end )) * 10
    [word, value_nova]
  
  end
end
