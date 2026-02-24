defmodule Rules do
  def eat_ghost?(power_pellet_active?, touching_ghost?) 
    when is_boolean(power_pellet_active?) 
    and power_pellet_active? == true
    and touching_ghost? == true
    and is_boolean(touching_ghost?), do: true
  def eat_ghost?(_, _), do: false

  def score?(touching_power_pellet?, touching_dot?)
    when is_boolean(touching_power_pellet?) and touching_power_pellet? == true
    or is_boolean(touching_dot?) and touching_dot? == true, do: true
  def score?(_, _), do: false

  def lose?(power_pellet_active?, touching_ghost?)
    when is_boolean(power_pellet_active?) and power_pellet_active? == false
    and is_boolean(touching_ghost?) and touching_ghost? == true, do: true
  def lose?(_, _), do: false

   def win?(has_eaten_all_dots?, power_pellet_active?, touching_ghost?)
    when is_boolean(has_eaten_all_dots?) and has_eaten_all_dots? == false or has_eaten_all_dots? == true
    and is_boolean(power_pellet_active?) and power_pellet_active? == false
    and is_boolean(touching_ghost?) and touching_ghost? == true, do: false
  def win?(_, _, _), do: true
end
