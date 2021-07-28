defmodule AskArea do

  @moduledoc """
  Contains the `AskArea.area` function that asks the user for input and uses the input to calculate the area of a shape using the `Geom.area` function
  """
  
  def area() do
    shape = IO.gets("R)ectangle, T)riangle, or E)llipse: ") |> String.trim() |> String.first() |> char_to_shape()
    {n1, n2} = case shape do
      :rectangle -> get_dimensions("length", "breadth")
      :triangle -> get_dimensions("base", "height")
      :ellipse -> get_dimensions("major radius", "minor radius")
      :unknown -> {0,0}
    end
    calculate(shape, n1, n2)
  end

  @spec char_to_shape(String.t()) :: atom()
  def char_to_shape(char) do
    case char |> String.upcase() do
      "R" -> :rectangle
      "T" -> :triangle
      "E" -> :ellipse
      _ -> :unknown
    end
  end

  @spec get_number(String.t()) :: integer()
  def get_number(prompt) do
    IO.gets("Enter #{prompt} >") |> String.trim() |> String.to_integer()
  end

  @spec get_dimensions(String.t(), String.t()) :: tuple()
  def get_dimensions(a1, a2) do
    {get_number(a1), get_number(a2)}
  end

  @spec calculate(atom(), number(), number()) :: number()
  def calculate(:unknown, _n1, _n2) do
    "Unknown shape"
  end

  def calculate(shape, n1, n2) when n1>=0 and n2>=0 do
    Geom.area({shape, n1, n2})
  end

  def calculate(_shape, _n1, _n2) do
    "Both dimensions must be greater than or equal to zero"
  end
end