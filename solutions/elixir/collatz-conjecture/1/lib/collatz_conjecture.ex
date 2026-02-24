defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc1(pos_integer()) :: non_neg_integer()
  def calc1(1) do
    0
  end
  def calc1(input) when rem(input, 2) == 0 do
   1 + calc(div(input, 2))
    
  end
   def calc1(input) when rem(input, 2) == 1 do
    1 + calc(3 * input + 1)
  end
  
  @spec calc(pos_integer()) :: non_neg_integer()
  
  def calc(1), do: 0

  def calc(n) when is_integer(n) and n > 1 and rem(n, 2) == 0 do
    1 + calc(div(n, 2))
  end

  def calc(n) when is_integer(n) and n > 1 do
    1 + calc(3 * n + 1)
  end
end
