defmodule LifeStateless do
  import LifeCore
  def play(state, n_iter \\ 10) do
    range = 1..n_iter
    Enum.each(range, fn _ ->
      IO.inspect LifeCore.next_iter(state)
    end)

  end

end

