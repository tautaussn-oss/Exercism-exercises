defmodule LogLevel do
  def to_label(label, legacy?) do
    cond do 
      label == 0 and legacy? == false -> :trace
      label == 1 -> :debug
      label == 2 -> :info
      label == 3 -> :warning
      label == 4 -> :error
      label == 5 and legacy? == false -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)
    cond do
      label == :error or label == :fatal -> :ops
      label == :unknown and legacy? == true -> :dev1
      label == :unknown -> :dev2
      true -> false
      
    end
  end
end

