defmodule Dijkstra do
  @moduledoc """
  The `Dijkstra` module contains the function to calculate the greatest common divisor of two integers using a method devised by Edsger W. Dijkstra.
  """
  @doc since: "Elixir 1.12.0 (compiled with Erlang/OTP 24)"

  @doc """
  The `gcd` function uses a recursive method to find the Greatest Common Divisor of two integers. If:
  - the two integers (m, n) are equal -> the GCD is method
  - if m is greater than n, the result is the GCD of m-n
  - Otherwise m must be less than n, and the result is the GCD of m and n-m.

  ## Examples


    iex> Dijkstra.gcd(4, 12)
    4

    iex> Dijkstra.gcd(21, 280)
    7
  """
  @spec gcd(integer(), integer()) :: integer()
  def gcd(m, n) do
    cond do
      m == n -> m
      m > n -> gcd(m-n, n)
      m < n -> gcd(m, n-m)
    end
  end
end