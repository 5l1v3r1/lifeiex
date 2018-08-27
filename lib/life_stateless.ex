defmodule LifeStateless do
  import LifeCore, only: [next_iter: 1]

  def play(state, n_iter \\ 10) do
    range = 1..n_iter

    Enum.each(range, fn _ ->
      IO.inspect(next_iter(state))
    end)
  end
end
