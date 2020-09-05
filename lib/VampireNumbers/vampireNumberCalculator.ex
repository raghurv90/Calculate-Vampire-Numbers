defmodule Vampire.VampireNumbers.VampireNumberCalculator do

	alias Vampire.VampireNumbers.{NewWorkersSupervisor,Worker,IntervalCalculator}

	defp startNewTask(n1, n2, vampireNumbersListStore) do
			Task.Supervisor.async(NewWorkersSupervisor, fn ->
				Worker.runWorker(n1, n2, vampireNumbersListStore)
			end, shutdown: :infinity)
	end

	defp getNumActors(beginning_number, end_number) do
		cond do
			end_number-beginning_number<1000 ->end_number-beginning_number-1
			# true -> round(:math.sqrt(end_number-beginning_number)) #1000
			true->1000
		end
	end

	def calculate_vampire_numbers(beginning_number, end_number, vampireNumbersListStore) do
		num_actors = getNumActors(beginning_number, end_number)
		1..num_actors 	|> Enum.map(fn interval_number-> IntervalCalculator.calculateInterval(beginning_number,
												end_number, interval_number, num_actors) end)
										|> Enum.map(fn [x, y] ->
									 			startNewTask(x, y, vampireNumbersListStore) end)
									 	|> Enum.map(fn process ->
										 		Task.await(process, 3000000000) end)

		{:ok,0}
	end


end
