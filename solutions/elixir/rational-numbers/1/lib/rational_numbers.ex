defmodule RationalNumbers do
  @type rational :: {integer, integer}
  defstruct numerator: nil, denominator: nil
  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  #def from_float(float, precision \\ 10) do
  #  numerator = round(float * precision)
   # denominator = precision

   # gcd = Integer.gcd(numerator, denominator)

   # {div(numerator, gcd), div(denominator, gcd)}
 # end

  def add({a1, b1}, {a2, b2}) when b1 == b2 do
    a = a1 + a2
    b = b1
    reduce({a,b})
  end
  def add({a1, b1}, {a2, b2}) when b1 != b2 do
    a = ((a1 * b2) + (a2 * b1))
    b = (b1 * b2)
    reduce({a,b})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
   def subtract({a1, b1}, {a2, b2}) when b1 != b2 do
    a = ((a1 * b2) - (a2 * b1))
    b = (b1 * b2)
    reduce({a,b})
  end
  def subtract({a1, b1}, {a2, b2}) when b1 == b2 do
    a = a1 - a2
    b = b1
    reduce({a,b})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a1, b1}, {a2, b2}) do
    a = a1 * a2
    b = b1 * b2
    reduce({a,b})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({a1, b1}, {a2, b2}) do
  a = a1 * b2
  b = b1 * a2
  reduce({a, b})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({a1, b1}) do
    a = Kernel.abs(a1)
    b = Kernel.abs(b1)
    reduce({a,b})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(_r, 0), do: {1, 1}
  def pow_rational({a1, b1}, n) when n > 0 and is_integer(n) do
    a = Integer.pow(a1, n)
    b = Integer.pow(b1, n)
    reduce({a, b})
  end
  def pow_rational({a1, b1}, n) when n < 0 and is_integer(n) do
    a = Integer.pow(b1, -n)
    b = Integer.pow(a1, -n)
    reduce({a, b})
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(_x, 0), do: {1,1}
  def pow_real(x, {a1, b1}) do
    :math.pow(x, a1/b1)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({a1, b1}) do
    gcd = Integer.gcd(a1, b1)

    a = div(a1, gcd)
    b = div(b1, gcd)
    
    if b < 0 do
      {-a, -b}
    else
      {a, b}
    end
  end
end
