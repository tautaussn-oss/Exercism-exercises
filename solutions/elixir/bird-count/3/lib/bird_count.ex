defmodule BirdCount do
  
  def today([]), do: :nil
  
  def today(list) do
    [head | _tail] = list
    head
  end
  
  def increment_day_count([]), do: [1]
  
  def increment_day_count([head | tail]), do: [head + 1 | tail]
  
  def has_day_without_birds?([]), do: false    
  def has_day_without_birds?([0 | _]), do: true      
  def has_day_without_birds?([_ | tail]), do: has_day_without_birds?(tail)
  
  def total([]), do: 0
  def total(list) do
    Enum.reduce(list, 0, fn x, acc -> x + acc end)
    
  end

  def busy_days(list) do
    Enum.count(list, fn x -> x>=5 end)
  end
end
