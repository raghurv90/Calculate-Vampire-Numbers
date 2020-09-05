defmodule Vampire.VampireNumbers.VampireFangs do

 def check_vampire(number) do
    if rem(count_digits(number),2) == 0 do
    range_left = left_limit(number)
    range_right = right_limit(number)
    newList = Enum.filter(range_left..range_right, fn n -> check_fang(number,n) end)
    if(!Enum.empty?(newList), do: print_fangs(number, newList), else: :null)
    end
 end

defp print_fangs(number, list_of_fangs) do
    fangsSetList = Enum.map(list_of_fangs, fn fang -> [fang,div(number, fang)] end)
    fangsSetList = List.insert_at(fangsSetList, 0, number)
    Enum.join(List.flatten(fangsSetList), " ")
 end

 defp check_fang(number,fang1) do
      fang2 = div(number,fang1)
      cond do
          rem(number,fang1)!=0 -> false
          rem(fang1,10) == 0 && rem(fang2,10) == 0 -> false
          fang_list_check(number,fang1,fang2) -> true
          true -> false
      end
  end

  defp fang_list_check(number,fang1,fang2) do
    digits_list = to_digits(number)
    fang_digits_list = to_digits(fang1) ++ to_digits(fang2)
    if list_sort(fang_digits_list) ==  list_sort(digits_list), do: true, else: false
  end


 defp right_limit(number) do
   round(:math.sqrt(number))
 end

 defp left_limit(number) do
  digit_number = count_digits(number)/2
  pow_div = round(:math.pow(10,digit_number))
  div(number,pow_div)
 end

 defp count_digits(number) do
   digits_list = to_digits(number)
   digit_list_count(digits_list)
 end

 defp to_digits(number) do
   Integer.digits(number)
 end

 defp digit_list_count(list) do
  Enum.count(list)
 end

 defp list_sort(list) do
   Enum.sort(list)
 end

end
