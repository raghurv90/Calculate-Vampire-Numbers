defmodule Mix.Tasks.MixTaskExample do
  use Mix.Task

  def run(_) do
    {:ok, _pid} = Vampire.Supervisor.start_link
    Vampire.VampireNumbers.Store.calculateVampireNumbers(100, 1000)
  end
end
