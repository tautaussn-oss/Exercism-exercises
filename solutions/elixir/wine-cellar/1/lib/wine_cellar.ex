defmodule WineCellar do
  def explain_colors do
    [
    white: "Fermented without skin contact.",
    red: "Fermented with skin contact using dark-colored grapes." ,
    rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end
# Rjesenje
  def filter(cellar, color, opts \\ []) do
    Keyword.get_values(cellar, color)
    |> filter_by_year(opts[:year])
    |> filter_by_country(opts[:country])
  end
  
  defp filter_by_year(wines, nil), do: wines
  defp filter_by_country(wines, nil), do: wines

#Moje sto mi je logicnije
 # def filter_moje(cellar, color) do
 #   Keyword.get_values(cellar, color)
 # end

 #def filter_moje(cellar, color, year) do
 #   cellar
#    |> filter_moje(color)
#   |> filter_by_year_moje(year)
#  end
#  def filter_moje(cellar, color, country) do
#    cellar
 #   |> filter_moje(color)
 #   |> filter_by_country_moje(country)
 # end
  
 # def filter_by_year_moje(cellar, year: year) do
 #   Enum.filter(cellar, fn {_x,y,_z} -> y == year end)
 # end
 # def filter_by_country_moje(cellar, country: country) do
  #  Enum.filter(cellar, fn {_x,_y,z} -> z == country end)
 # end
#
  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end
