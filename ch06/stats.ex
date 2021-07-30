defmodule Stats do

  @moduledoc """
  The `Stats` module contains the `Stats.minimum/1` , `Stats.maximum/1` and `Stats.range/1` functions.
  """

  @doc since: "July 29, 2021"

  @doc """
  The `Stats.minimum/1` function takes a list of numbers as its argument and returns the smallest value.
  """

  @spec minimum(list()) :: number()
  def minimum(nums) do
    [first | rest] = nums
    minimum(rest, first)
  end

  @spec minimum(list(), number()) :: number()
  def minimum([], first) do
    first
  end

  def minimum(rest, first) do
    [head | tail] = rest
    cond do
      head < first ->
        minimum(tail, head)
      true -> minimum(tail, first)
    end
  end

  @doc since: "July 29, 2021"

  @doc """
  The `Stats.maximum/1` function takes a list of numbers as its argument and returns the largest value.
  """

  @spec maximum(list()) :: number()
  def maximum(nums) do
    [first | rest] = nums
    maximum(rest, first)
  end

  def maximum([], first) do
    first
  end

  def maximum(rest, first) do
    [head | tail] = rest
    cond do
      head > first ->
        maximum(tail, head)
      true -> maximum(tail, first)
    end
  end
  
  @doc since: "July 29, 2021"

  @doc """
  The `Stats.range/1` function takes a list of numbers as its argument and returns a list containing the maximum and minimum values in the list.
  """

  @spec range(list()) :: list()
  def range(nums) do
    [minimum(nums), maximum(nums)]
  end

end