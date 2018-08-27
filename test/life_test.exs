defmodule LifeTest do
  use ExUnit.Case
  doctest LifeCore

  test "next_iter" do
    s = MapSet.new([{-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1}])

    expected =
      MapSet.new([
        {-2, -1},
        {-2, 0},
        {-2, 1},
        {-1, -2},
        {-1, -1},
        {-1, 1},
        {-1, 2},
        {0, -2},
        {0, 2},
        {1, -2},
        {1, -1},
        {1, 1},
        {1, 2},
        {2, -1},
        {2, 0},
        {2, 1}
      ])

    assert LifeCore.next_iter(s) == expected
  end
end
