defmodule LifeStatefull do
  import LifeCore, only: [next_iter: 1]

  @spec play(MapSet.t(Tuple.t(Integer)), integer()) :: :ok
  def play(state, n_iter \\ 10) do
    {:ok, agent} = Agent.start_link(fn -> MapSet.new(state) end)
    range = 1..n_iter

    Enum.each(range, fn _ ->
      Agent.update(agent, fn state -> next_iter(state) end)
      IO.inspect(Agent.get(agent, fn state -> state end))
    end)

    Agent.stop(agent)
  end
end
