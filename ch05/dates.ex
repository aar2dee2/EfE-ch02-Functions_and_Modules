defmodule Dates do
  @moduledoc """
    The `Dates` module contains the `Dates.date_parts` function
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
end