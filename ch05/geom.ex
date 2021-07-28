defmodule Geom do
  @moduledoc """
  The `Geom` module contains the area function
  Created by: @aar2dee2
  Date: July 25, 2021
  """

  @doc """
  The `Geom.area` function calculates the area of a 2-D shape given its dimensions. It takes 1 as the default argument for each parameter. The shape should be passed as an atom: :rectangle, :triangle or :ellipse as the first argument.

  ## Examples

    iex> Geom.area(4,3)
    12

  """
  @doc since: "July 25, 2021"

  @spec area({atom(), number(), number()}) :: number()
  def area({shape, a, b}) do
    area(shape, a, b)
  end


  @spec area(atom(), number(), number()) :: number()
  def area(shape, a \\ 1, b \\ 1) when a>0 and b>0 do
    case shape do
      :rectangle -> a * b
      :triangle -> 1/2 * a * b
      :ellipse -> :math.pi() * a * b
      _ -> 0
    end
  end

end