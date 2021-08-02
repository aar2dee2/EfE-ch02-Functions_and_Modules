defmodule Teeth do
  @moduledoc """
  The `Teeth` module 
  """

  @doc since: "Elixir 1.12.0 (compiled with Erlang/OTP 24)"
  @doc """
  The `Teeth.alert/1` function  takes a list of 32 lists of six numbers as its input. If a tooth isn’t present, it is represented by the list [0] instead of a list of six numbers. The function produces a list of the tooth numbers that require attention. The numbers must be in ascending order.
  """

  @spec alert(list()) :: list()
  def alert(teeth) do
    Enum.map(teeth, &Enum.max(&1) >= 4)
      |> Enum.with_index(1)
      |> Keyword.get_values(true)
      #The one above is even better. the list of tuples consists exclusively of two-element tuples so it's a 'Keyword list'. Can, thus, use the 'Keyword' module. 
      # Keyword.get_values/2 returns a list of all values matching a particular keyword.
      #|> Enum.filter(&elem(&1,0))
      #|> Enum.map(&elem(&1,1))
      #Had earlier used the code commented below to get values from the list of tuples that you get after Enum.with_index(1).
      #instead of creating a separate function, 'elem' can be used to get values from a tuple. elem/2 takes the tuple as first argument and index of the element required as second argument.
      #|> Enum.map(&true_false(&1))
      #|> Enum.filter(& !is_nil(&1))
  end

  #def true_false({true, b}) do
   # b
  #end

  #def true_false({false, _b}) do
   # :nil
  #end

  def pocket_depths do
    [[0], [2,2,1,2,2,1], [3,1,2,3,2,3],
    [3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],
    [3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],
    [3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],
    [1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],
    [3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],
    [3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],
    [1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],
    [3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],
    [3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],
    [3,2,3,2,3,2]]
  end

end