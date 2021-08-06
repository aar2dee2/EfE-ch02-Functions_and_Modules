defmodule Cards do
  def make_deck() do
     for (x,y) <- decks, do: y
  end
end