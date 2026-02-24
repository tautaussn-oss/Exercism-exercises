defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
  price = Keyword.get(options, :maximum_price, 100)
  # Necu ovo da radim sa Keyword.get, moze li se ikako pattern matchivati ovdje?
    for x <- tops,
       y <- bottoms,
       x.base_color != y.base_color,
       x.price + y.price < price
       do
       {x , y}
       end
  end
end
