defmodule NameBadge do

     def print(id, name, department) when department == nil and id == nil do
     "#{name} - OWNER"
     end

  def print(id, name, department) when department == nil do
     "[#{id}] - #{name} - OWNER"
     end

  def print(id, name, department) do
        if id == nil do
           "#{name} - #{String.upcase(department)}"
        else 
            "[#{id}] - #{name} - #{String.upcase(department)}"
        end
  end

end
