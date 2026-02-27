defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          {{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}
  def from({{year, month, day}, {hours, minutes, seconds}} = d) do
    {:ok, date} = d |> NaiveDateTime.from_erl()

    date
    |> NaiveDateTime.add(1000000000, :second)
    |> NaiveDateTime.to_erl()
  end
end
