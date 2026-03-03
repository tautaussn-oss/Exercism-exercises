defmodule Clock do
  @type t() :: %__MODULE__{hour: integer, minute: integer}
  defstruct hour: 0, minute: 0

  @doc """
  Returns a clock that can be represented as a string:

      iex> Clock.new(8, 9) |> to_string
      "08:09"
  """
  @spec new(integer, integer) :: t()
  def new(hour, minute) do
    new(hour * 60 + minute)
  end

  defp new(total) when total < 0 do
    total = 1440 + rem(total, 1440)
    new(total)
  end
  
  defp new(total) do
    %Clock{hour: rem(div(total,60), 24), minute: rem(total, 60)}
  end

  # defp test_hour(h) when h > 24, do: rem(h, 24)
  # defp test_hour(h) when h == 24, do: 0
  # defp test_hour(h), do: h
  # defp test_minute(m) do
  # end
  defimpl String.Chars, for: Clock do
    def to_string(clock) do
      "#{pad(clock.hour)}:#{pad(clock.minute)}"
    end

    defp pad(n) when n < 10, do: "0#{n}"
    defp pad(n), do: "#{n}"
  end
  @doc """
  Adds two clock times:

      iex> Clock.new(10, 0) |> Clock.add(3) |> to_string
      "10:03"
  """
  @spec add(t(), integer) :: t()
  def add(%Clock{hour: hour, minute: minute}, add_minute) do
    new(hour, minute + add_minute)
  end

 # defp to_string(%Clock{hour: hour, minute: minute}) when hour < 10 and minute < 10 do
 # "0#{hour}:0#{minute}"
 # end
 # defp to_string(%Clock{hour: hour, minute: minute}) when hour < 10 do
 # "0#{hour}:#{minute}"
 # end
  #defp to_string(%Clock{hour: hour, minute: minute}) when minute < 10 do
  #"#{hour}:0#{minute}"
  #end
 # defp to_string(%Clock{hour: hour, minute: minute}) do
 # "#{hour}:#{minute}"
#end
end
