defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @colors [

black: 0,

brown: 1,

red: 2,

orange: 3,

yellow: 4,

green: 5,

blue: 6,

violet: 7,

grey: 8,

white: 9
]
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([color1, color2, color3 | _rest]) when color3 in [:black, :brown] do
    {((@colors[color1] * 10 + @colors[color2]) * (10**@colors[color3])), :ohms}
  end
   def label([color1, color2, color3 | _rest]) when color3 in [:orange, :yellow, :red] do
    {((@colors[color1] * 10 + @colors[color2]) * (10**@colors[color3])) / 1000, :kiloohms}
  end
   def label([color1, color2, color3 | _rest]) when color3 in [:blue, :violet, :green] do
    {((@colors[color1] * 10 + @colors[color2]) * (10**@colors[color3])) / 1000000, :megaohms}
  end
   def label([color1, color2, color3 | _rest]) when color3 in [:white, :grey] do
    {((@colors[color1] * 10 + @colors[color2]) * (10**@colors[color3])) / 1000000000, :gigaohms}
  end

  
end
