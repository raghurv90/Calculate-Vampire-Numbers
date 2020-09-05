defmodule Vampire.Supervisor do
	import Supervisor.Spec
	use Supervisor

	def start_link() do
		Supervisor.start_link(__MODULE__, name: :main_supervisor)
	end

	def init(_) do
		children=[
			{Vampire.VampireNumbers.StoreSupervisor, name: :vampire_server_supervisor},
			{Task.Supervisor, name: Vampire.VampireNumbers.NewWorkersSupervisor}
		]
		Supervisor.init(children, strategy: :one_for_one, shutdown: :infinity)
	end

end
