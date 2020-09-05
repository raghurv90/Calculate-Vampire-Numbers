defmodule Vampire.VampireNumbers.StoreSupervisor do
	use Supervisor

	def start_link(_args) do
		Supervisor.start_link(__MODULE__, name: :vampire_server_supervisor)
	end

	def init(_) do
		children=[
			worker(Vampire.VampireNumbers.Store, [], shutdown: :infinity)
		]
		supervise(children,  strategy: :one_for_one, shutdown: :infinity)
	end

end
