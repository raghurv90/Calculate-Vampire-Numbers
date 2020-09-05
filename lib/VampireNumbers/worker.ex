defmodule Vampire.VampireNumbers.Worker do

	use Task, restart: :transient

	def start_link(args) do
		Task.start_link(__MODULE__, :run, [args])
	end

	def runWorker(n1, n2, vampireNumbersListStore) do
		list = Enum.map(n1..n2, fn number ->Vampire.VampireNumbers.VampireFangs.check_vampire(number) end)
		newList = Enum.filter(list, fn number ->
			cond do
				number == :null -> false
				true -> true
			end
		end)

		if(!Enum.empty?(newList)) do
			Enum.each(newList, fn vampireNumberAndFangs ->
				Agent.update(vampireNumbersListStore, fn list -> [vampireNumberAndFangs | list] end) end)
		end
		{:ok, newList}
	end

end
