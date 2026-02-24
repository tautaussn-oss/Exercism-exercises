defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end
  defp ask_name_moja() do
  input = String.trim("What is your character's name?\n")
  IO.gets(input)
  end
  def ask_name() do
   IO.gets("What is your character's name?\n") |> String.trim
  end

  def ask_class() do
    IO.gets("What is your character's class?\n") |> String.trim
  end

  def ask_level() do
    IO.gets("What is your character's level?\n") |> String.trim |> String.to_integer
  end

  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()
    player = %{class: class, level: level, name: name}
    IO.inspect(player, label: "Your character")
  end
end
