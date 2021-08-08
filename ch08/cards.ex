defmodule Cards do
  @moduledoc """
  A module with functions to create a deck of playing cards and another function to shuffle the deck
  """
  
  @doc """
  Creates a deck of playing cards as a list of tuples where each tuple has the name of the card and the color.
  """
  @spec make_deck() :: list(tuple())
  def make_deck() do
     colors = ["Spades", "Hearts", "Clubs", "Diamonds"]
     cards = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"] 
     for x <- cards, y <- colors, do: {x, y}
  end

  @doc """
  shuffles a given list of tuples using the Fisher and Yates Shuffle method 
  """
  @spec shuffle(list(tuple())) :: list(tuple())
  def shuffle(deck) do
    _ = :rand.seed(:exs1024, :erlang.timestamp())
    shuffle(deck, [])
  end

  def shuffle([], acc) do
    acc
  end

  def shuffle(list, acc) do
    {leading, [h | t]} = 
      Enum.split(list, :rand.uniform(Enum.count(list)-1))
    shuffle(leading ++ t, [h | acc])
  end
end