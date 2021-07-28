defmodule Powers do
  import Kernel, except: [raise: 2, raise: 3]

  @moduledoc """
  The `Powers` module contains the `Powers.raise` and the `Powers.nth_root` functions that calculate values of a number raised to various exponents.
  """
  
  @doc since: "July 27, 2021"

  @doc """
  The `Powers.raise` function calculates the value of the first argument raised to the power the second argument.

  ## Examples

    iex> Powers.raise(5, 3)
    125

    iex> Powers.raise(16, 0)
    1

    iex> Powers.raise(2, -10)
    9.765625e-4
  """

  def raise(x, n) do
    case n do
      n when n < 0 -> 1 / raise(x, 1, abs(n))
      n when n == 0 -> 1
      n when n >= 1 -> 
        #IO.puts("This is case with power#{n}")
        raise(x, 1, n)
    end
  end

  def raise(x, acc, n) when n>0 do
    raise(x, x * acc, n-1)
  end

  def raise(_x, acc, _n) do
    acc
  end

  @doc """
  The `Powers.nth_root` function calculates the nth root of a number where n is an integer.

  ## Examples
    iex> Powers.nth_root(25, 2)
    5.0

    iex> Powers.nth_root(2,2)
    1.4142135623730951

  """

  @spec nth_root(number(), integer()) :: number()
  def nth_root(1, _n) do
    1
  end

  def nth_root(0, _n) do
    IO.puts("Cannot be calculated")
  end

  def nth_root(x, n) do
    nth_root(x, n, x/2)
  end

  defp nth_root(x, n, a) do
    #IO.puts("Current guess is #{a}")
    f = raise(a, n) - x
    f_prime = n * raise(a, n-1)
    next = a - f/f_prime
    change = abs(next-a)
    cond do
      change < 1.0e-8 -> next
      true -> nth_root(x, n, next)
    end
  end

end