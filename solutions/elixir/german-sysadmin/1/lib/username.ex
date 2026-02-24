defmodule Username do
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
    rez = 
      Enum.flat_map(username, fn
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      char -> [char]
    end)
    Enum.filter(rez, fn x -> ?a <= x and x <= ?z or x == ?_ end)
    
    
  end
end
