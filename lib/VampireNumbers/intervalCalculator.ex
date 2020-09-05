defmodule Vampire.VampireNumbers.IntervalCalculator do
  def calculateInterval(beginning_number, end_number, interval_number, number_of_intervals) do
    beginning_number=beginning_number-1
    range=end_number-beginning_number
    n1 = beginning_number +  div(range*(interval_number-1), number_of_intervals) +1
    n2 = beginning_number + div(range*interval_number, number_of_intervals)
    [n1,n2]
  end
end
