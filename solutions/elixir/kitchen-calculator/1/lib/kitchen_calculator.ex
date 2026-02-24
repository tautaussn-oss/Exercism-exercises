defmodule KitchenCalculator do
  def get_volume({_, volume}), do: volume
  def to_milliliter({:cup, value}), do: {:milliliter, value * 240.0}
  def to_milliliter({:fluid_ounce, value}), do: {:milliliter, value * 30.0}
  def to_milliliter({:tablespoon, value}), do: {:milliliter, value * 15.0}
  def to_milliliter({:teaspoon, value}), do: {:milliliter, value * 5.0}
  def to_milliliter({:milliliter, value}), do: {:milliliter, value}

  def from_milliliter({:milliliter, volume} , :cup), do: {:cup, volume / 240.0}
  def from_milliliter({:milliliter, volume} , :fluid_ounce), do: {:fluid_ounce, volume / 30.0}
  def from_milliliter({:milliliter, volume} , :tablespoon), do: {:tablespoon, volume / 15.0}
  def from_milliliter({:milliliter, volume} , :teaspoon), do: {:teaspoon, volume / 5.0}
  def from_milliliter({:milliliter, volume} , :milliliter), do: {:milliliter, volume}

  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)

  end
end
