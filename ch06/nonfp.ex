defmodule NonFP do
@moduledoc """
A module to generate random numbers for use in functions in other modules"""

@doc """The `NonFP.generate_pockets/2` generates a list of numbers for use
"""
  @spec generate_pockets(list(), number()) :: list(list)
  def generate_pockets(tooth, prob) do
    :rand.seed(:erlang.timestamp())
    generate_pockets(tooth, prob, [])
  end
  
  @spec generate_pockets(charlist(), number(), list()) :: list()
  def generate_pockets([], _prob, acc) do
    #need to edit first argument 'tooth' to represent case for empty charlist
    acc |> Enum.reverse()
  end

  def generate_pockets([head | tail], prob, acc) when head == ?T do
    generate_pockets(tail, prob, [generate_tooth(prob) | acc])
  end

  def generate_pockets([_head | tail], prob, acc)do
    generate_pockets(tail, prob, [[0] | acc])
  end

  def generate_tooth(prob) do
    num = :rand.uniform()
    cond do
      num < prob -> generate_tooth(2, 6, [])
      true -> generate_tooth(3, 6, [])
    end
  end

  def generate_tooth(_base_depth, 0, depths) do
    depths
  end

  def generate_tooth(base_depth, count, depths) do
    generate_tooth(base_depth, count-1, depths ++ [Enum.random(-1..1) + base_depth])
  end
end