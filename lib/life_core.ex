defmodule LifeCore do
  @moduledoc """
  Implementation of Conway's Game of Life
  """

  @doc """
  ## Examples
    iex> LifeCore.compute_neighboors(0, 0)
    #MapSet<[{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}]>

  """
  def compute_neighboors(x, y) do
    offsets = MapSet.new([-1, 0, 1])
    for a <- offsets, b <- offsets, {a, b} != {0, 0}, into: MapSet.new(), do: {x + a, y + b}
  end

  @spec compute_enveloppe(MapSet.t(Tuple.t(Integer))) :: MapSet.t(Tuple.t(Integer))
  def compute_enveloppe(state) do
    envelopes = for {x, y} <- state, into: MapSet.new(), do: compute_neighboors(x, y)

    envelopes
    |> Enum.reduce(&MapSet.union/2)
    |> MapSet.union(state)
  end

  @spec intersection_size(Integer, Integer, MapSet.t(Tuple.t(Integer))) :: non_neg_integer()
  def intersection_size(x, y, state) do
    compute_neighboors(x, y)
    |> MapSet.intersection(state)
    |> MapSet.size()
  end

  @spec check_rules(Integer, Integer, MapSet.t(Tuple.t(Integer))) :: boolean()
  def check_rules(x, y, state) do
    size = intersection_size(x, y, state)

    cond do
      size == 2 and {x, y} in state  -> true
      size <= 2 -> false
      size == 3 -> true
      size > 3 -> false
    end
  end

  @spec next_iter(MapSet.t(Tuple.t(Integer))) :: MapSet.t(Tuple.t(Integer))
  def next_iter(state) do
    envelope = compute_enveloppe(state)
    IO.inspect envelope
    for {x, y} <- envelope, check_rules(x, y, state), into: MapSet.new(), do: {x, y}
  end
end
