defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]
  
  def new() do
    %RemoteControlCar{nickname: "none"}
  end

  def new(nickname) do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: distance}) do
    "#{distance} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: percentage}) when percentage == 0, do: "Battery empty"
  def display_battery(%RemoteControlCar{battery_percentage: percentage}) do
    "Battery at #{percentage}%"
  end

  def drive(%RemoteControlCar{battery_percentage: perc} = car) when perc == 0, do: car
  def drive(%RemoteControlCar{battery_percentage: perc, distance_driven_in_meters: dis} = car) do
  %RemoteControlCar{car | 
  battery_percentage: perc - 1, distance_driven_in_meters: dis + 20}
    
  end
end
