defmodule LibraryFees do
  def datetime_from_string(string) do
     NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(%NaiveDateTime{hour: hour}) do
    hour < 12
  end

  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime) do
      Date.add(checkout_datetime, 28)
    else 
      Date.add(checkout_datetime, 29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
   # date2 = NaiveDateTime.to_date(actual_return_datetime)
   # date3 = Date.diff(date2, planned_return_date)
   #max(date3, 0)
      
    actual_return_datetime
     |> NaiveDateTime.to_date()
     |> Date.diff(planned_return_date)
     |> max(0)
  end

  def monday?(datetime) do
    monday = datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week()

    case monday do
      1 -> true
      _ -> false
    end
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout = datetime_from_string(checkout)
    return = datetime_from_string(return)
    
    c =  days_late(return_date(checkout), return)

    if monday?(return) do
      div((c*rate), 2)
    else
      c*rate

    end
    
  end
end
