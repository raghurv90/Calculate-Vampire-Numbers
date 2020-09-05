	defmodule Vampire.VampireNumbers.Store do
	use GenServer
	alias Vampire.VampireNumbers.VampireNumberCalculator

	def start_link() do
		GenServer.start_link(__MODULE__, [], name: :vampire_server )
	end

	def init(_) do
		{:ok, []}
	end

	def calculateVampireNumbers(n1, n2) do
		{:ok, vampireNumbersListStore} = Agent.start_link fn -> [] end
		GenServer.call(:vampire_server, {:calculate_vampire_numbers,n1, n2, vampireNumbersListStore}, 3000000000)
		result_list = Agent.get(vampireNumbersListStore, fn content -> content end)
		GenServer.call(:vampire_server, {:print_vampire_numbers, result_list}, 3000000000)
		Agent.stop(vampireNumbersListStore)
	end

	def handle_call({:calculate_vampire_numbers, n1, n2, vampireNumbersListStore}, _from, _vampire_numbers_list) do
		VampireNumberCalculator.calculate_vampire_numbers(n1,n2, vampireNumbersListStore)
		{:reply,[],[]}
	end

	def handle_call({:print_vampire_numbers, result_list}, _from, _vampire_numbers_list) do
		Enum.each(result_list,fn item -> IO.puts("#{item}") end )
		{:reply,[],[]}
	end


end
