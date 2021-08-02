defmodule Dates do
  @moduledoc """
    The `Dates` module contains the `Dates.date_parts/1` and `Dates.julian/1` functions.
  """
  @doc since: "Elixir 1.12.0 (compiled with Erlang/OTP 24)"

  @doc """
  The `Dates.date_parts` function divides a date entered in the ISO format 'yyyy-mm-dd' into a list of 3 parts [yyyy, mm, dd]

  ## Examples
      iex> Dates.date_parts("2021-07-28")
      [2021, 07, 28]
  """
  @spec date_parts(String.t()) :: list()
  def date_parts(date) do
    date |> String.split("-", parts: 3) |> Enum.map(&String.to_integer(&1))
  end

  @doc since: "Elixir 1.12.0 (compiled with Erlang/OTP 24)"

  @doc """
  The `Dates.julian/1` function accepts a string in ISO format ("yyyy-mm-dd") and returns the Julian date: the day of the year.

  ## Examples
      iex> 

      iex>

  """

  @spec julian(String.t()) :: number()
  def julian(date) do
    parts = date_parts(date)
    days_in_feb = cond do
        is_leap_year(Enum.fetch!(parts,0)) -> 29
        true -> 28
      end
    days_per_month = [31, days_in_feb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    month_total(Enum.fetch!(parts, 1), days_per_month, 0) + Enum.fetch!(parts, 2)
  end

  @doc since: "Elixir 1.12.0 (compiled with Erlang/OTP 24)"
  
  
  #The `Dates.is_leap_year/1` function is a helper function for the `Dates.julian/1` function to help determine the number of days in February in the `Dates.julian/1` function.

  #The `Dates.is_leap_year/1` takes a year (integer) as the argument and returns `true` if the given year is a leap year, else returns `false`.
  
  @spec is_leap_year(number()) :: boolean()
  defp is_leap_year(year) do
    (rem(year,4) == 0 and rem(year,100) != 0)
    or (rem(year, 400) == 0)
  end


  @doc since: "Elixir 1.12.0 (compiled with Erlang/OTP 24)"

  @doc """
  The `Dates.month_total/3` function gives the number of days in the year upto the beginning of a month. It takes 3 arguments - the month number, a list with the number of days in each of the 12 months (in order from January to December) and an accumulator.
  The `Dates.month_total/3` function is intended to a be a helper function for the `Dates.julian/1` function.
  """
  def month_total(1, _days_per_month, acc) do
    acc
  end

  def month_total(month, days_per_month, acc) when month >1 do
    [head | tail] = days_per_month
    month_total(month-1, tail, acc + head)
  end


end