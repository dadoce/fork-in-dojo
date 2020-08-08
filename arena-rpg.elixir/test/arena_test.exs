defmodule ArenaTest do
  use ExUnit.Case

  test "deveria criar uma arena 10 x 20" do
    arena = %Arena{width: 10, height: 20}
    assert arena[:width] == 10
    assert arena[:height] == 20
  end
end
