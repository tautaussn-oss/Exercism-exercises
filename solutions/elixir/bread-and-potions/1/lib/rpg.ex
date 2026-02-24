defmodule RPG do
  defmodule Character do
    defstruct health: 100, mana: 0
  end
  
  defmodule LoafOfBread do
    defstruct []
  end


  defmodule ManaPotion do
    defstruct strength: 10
  end

  defmodule Poison do
    defstruct []
  end

  defmodule EmptyBottle do
    defstruct []
  end

  defprotocol Edible do
    def eat(item, character)
  end

  defimpl Edible, for: [RPG.LoafOfBread, RPG.Character] do
    def eat(_item, %RPG.Character{health: health, mana: mana}) do
    {nil, %RPG.Character{health: health+5, mana: mana}}
    end
  end

   defimpl Edible, for: [RPG.ManaPotion, RPG.Character] do
    def eat(%RPG.ManaPotion{strength: strength}, %RPG.Character{health: health, mana: mana}) do
    {%RPG.EmptyBottle{}, %RPG.Character{health: health, mana: mana+strength}}
    end
  end

  defimpl Edible, for: [RPG.Poison, RPG.Character] do
    def eat(%RPG.Poison{}, %RPG.Character{health: health, mana: mana}) do
    {%RPG.EmptyBottle{}, %RPG.Character{health: 0, mana: mana}}
    end
  end

end
