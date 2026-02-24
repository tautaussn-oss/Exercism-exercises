defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) when  (abs(x)*abs(x) + abs(y)*abs(y)) <= 1  do
    10
  end
  def score({x, y}) when  (abs(x)*abs(x) + abs(y)*abs(y)) <= 25  do
    5
  end
  def score({x, y}) when  (abs(x)*abs(x) + abs(y)*abs(y)) <= 100  do
    1
  end
  def score({x, y}) when  (abs(x)*abs(x) + abs(y)*abs(y)) > 100  do
    0
  end
end
