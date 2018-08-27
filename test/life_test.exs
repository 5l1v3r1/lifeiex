defmodule LifeTest do
  use ExUnit.Case
  doctest Life

  test "compute_neighboors" do
    assert Life.compute_neighboors(0, 0) ==
             MapSet.new([{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}])
  end
end
