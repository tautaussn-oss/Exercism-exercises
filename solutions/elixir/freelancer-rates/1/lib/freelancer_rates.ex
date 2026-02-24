defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - ( (discount / 100.0) * before_discount)
  end

  def monthly_rate(hourly_rate, discount) do
    temp = hourly_rate * 8 * 22
    round(Float.ceil(temp - ((discount / 100) * temp)))
  end

  def days_in_budget(budget, hourly_rate, discount) do
      Float.floor(budget / apply_discount(daily_rate(hourly_rate), discount), 1)
  end
end
