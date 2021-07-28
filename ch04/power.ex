defmodule Power do

  @moduledoc """
  The `Power` module contains the `Power.exponent` function that calculates the value of one number raised to the power the other number.
  """

  @doc since: "July 27, 2021"

  @doc """
  The `Power.exponent` function calculates the value of the first argument raised to the power the second argument.

  ## Examples

    iex> Power.exponent(5, 3)
    125

    iex> Power.exponent(16, 0)
    1

    iex> Power.exponent(2, -10)
    9.765625e-4
  """

  @spec exponent(number(), number()) :: number()
  def exponent(_x, 0) do
    1
  end

  def exponent(x, 1) do
    x
  end

  def exponent(x, n) when n > 1 do
    exponent(x, 1, n)
  end

  def exponent(x, n) when n < 0 do
    1 / exponent(x, 1, abs(n))
  end

  @spec exponent(number(), number(), number()) :: number()
  def exponent(_x, acc, 0) do
    acc
  end
  
  def exponent(x, acc, n) do
    exponent(x, acc * x, n-1)
  end

end