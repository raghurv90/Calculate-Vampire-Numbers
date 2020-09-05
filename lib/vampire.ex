defmodule Vampire do
  use Application

  def start(_type, _args) do
    # [a1, a2] = Enum.map(System.argv(), fn(n) -> String.to_integer(n) end)
    # prev = System.os_time()
    {:ok, pid} = Vampire.Supervisor.start_link
    # _value = Vampire.VampireNumbers.Store.calculateVampireNumbers(a1, a2)
    {:ok, pid}
    # next = System.os_time()
    # diff = next - prev
    # IO.puts("#{diff}")

  end
end
