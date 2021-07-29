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

  @spec get_number(String.t()) :: number()
  def get_number(prompt) do
    input = IO.gets("Enter #{prompt} >") |> String.trim()
    cond do
      #Regex.match?(~r/[[:alpha:]]/, input) 
      #Initially used this to weed out input with *any* alphabets, but since exponents need to be supported, this is not a great idea
      Regex.match?(~r/^[+-]?\d+$/, input) == true ->
          String.to_integer(input)
      Regex.match?(~r/^[+-]?\d+\.\d+([eE][+-]?\d+)?$/, input) == true ->
          String.to_float(input)
      true ->
          IO.puts("Input must be a number")
          get_number(prompt)
    end
    #Breakdown of the Regex used above:
    # For the integer match- 
    #the caret '^' is to match beginning of line and '$' is to match end of line
    #the square brackets '[]' are used to specify a group of characters. 
    #The '?' after the square brackets indicates that the characters preceding it may or may not be present
    #the 'd' is to indicate the digit class. A backslash '\' is used before the 'd' to indicate that the pattern match should be on the digit class represented by 'd' and not on the character 'd' itself.
    #For the float match:
    #The '.' is to match the decimal. A backslash '\' is used before it to indicate it must be matched on the actual dot and not as a special character
    #the pattern inside round parentheses'([eE][+-]?\d+)' indicates that this may or may not exist.
    # For the exponential notation:
    #the '[eE]' in square brackets are to match exponential notation. These are followed by '[+-]' in square brackets. There is question mark '?' after the '[+-]' to indicate that there may be __zero or one__ occurrence of these. Finally, there is the 'd' class preceded by a backslash - so that it is read as the digit class - and succeeded by the '+' to indicate that there may be __one or more__ of these.
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