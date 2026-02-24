defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name |> String.trim() |> String.first()
  end

  def initial(name) do
    (name |> first_letter() |> String.upcase()) <> "."
  end

  def initials(full_name) do
    lista = (full_name |> String.split())
    "#{initial(Enum.at(lista, 0))}" <> " " <> "#{initial(Enum.at(lista, 1))}"
  end

  def pair(full_name1, full_name2) do
    """
    ❤-------------------❤
    |  #{initials(full_name1)}  +  #{initials(full_name2)}  |
    ❤-------------------❤
    """
    # Please implement the pair/2 function
  end
end
