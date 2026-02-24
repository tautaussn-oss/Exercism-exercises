defmodule Secrets do
  def secret_subtract(secret) do
    _sub = fn x -> x - secret end
  end

  def secret_add(secret) do
    _adder = fn x -> x + secret end 
  end

  def secret_multiply(secret) do
    _mult = fn x -> x * secret end 
  end

  def secret_divide(secret) do
    _div = fn x -> div(x,secret) end
  end

  def secret_and(secret) do
    _band = fn x -> Bitwise.band(x , secret) end
  end

  def secret_xor(secret) do
    _bxor = fn x -> Bitwise.bxor(x , secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    #x |> secret_function1.() |> secret_function2.()
    fn x -> secret_function2.(secret_function1.(x)) end
  end
end
