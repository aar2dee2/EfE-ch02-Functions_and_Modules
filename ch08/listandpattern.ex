defmodule ListandPattern do

  @spec match_items(list(tuple)) :: list(tuple)
  def match_items(names) do
    for {name, gender, age} <- names, gender == "M" and age > 40, do:
      {name, gender, age}
  end

  @spec gender_age(list(tuple)) :: list(tuple)
  def gender_age(names) do
    for {name, gender, age} <- names, gender == "M" or age > 40, do:
      {name, gender, age}
  end
end