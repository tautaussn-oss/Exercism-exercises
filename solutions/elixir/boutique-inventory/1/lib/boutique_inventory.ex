defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, fn i -> i.price end)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn i -> i.price == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn i -> %{i | name: String.replace(i.name, old_word, new_word)} end)
  end

  def increase_quantity(item, count) do
    %{item | quantity_by_size: Map.new(item.quantity_by_size, fn {k,v} -> {k, v + count} end)}
  end
 

  def total_quantity(%{quantity_by_size: sizes}) do
    Enum.reduce(sizes, 0, fn {x, y}, acc -> y + acc end )
    
    
  end
end
