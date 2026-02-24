defmodule Lasagna do
  # Please define the 'expected_minutes_in_oven/0' function
  def expected_minutes_in_oven() do
    40
  end

  def remaining_minutes_in_oven(a) do
    temp = expected_minutes_in_oven()
    temp - a
  end

  def preparation_time_in_minutes(b) do
    2*b
  end

  def total_time_in_minutes(c,m) do
    (c * 2) + m
  end

  def alarm() do
    "Ding!"
  end
  
    

  # Please define the 'remaining_minutes_in_oven/1' function

  # Please define the 'preparation_time_in_minutes/1' function

  # Please define the 'total_time_in_minutes/2' function

  # Please define the 'alarm/0' function
end
