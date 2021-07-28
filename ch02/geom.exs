defmodule Geom do
  @moduledoc """
  The `Geom` module contains the area function
  Created by: @aar2dee2
  Date: July 25, 2021
  """

  @doc """
  The `Geom.area` function calculates the area of a rectangle given its length and width. It takes 1 as the default argument for each parameter.

  ## Examples
      iex> Geom.area(4,3)
      12

  """
  @doc since: "July 25, 2021"

  @spec area(number(), number()) :: number()
  def area(length \\ 1, width \\ 1) do
    length * width
  end

end