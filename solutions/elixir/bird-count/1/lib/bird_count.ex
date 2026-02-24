defmodule BirdCount do
  def today(list) do
    List.first(list)
  end
  def today([]), do: :nil
  
  def increment_day_count([]), do: [1]
  
  def increment_day_count([head | tail]), do: [head + 1 | tail]
  
  def has_day_without_birds?(list) do
     Enum.any?(list, fn x -> x == 0 end)
  end

  def total([]), do: 0
  def total(list) do
    Enum.reduce(list,0, fn x, acc -> acc = x + acc end)
    
  end

  def busy_days(list) do
    Enum.count(list, fn x -> x>=5 end)
  end
end
