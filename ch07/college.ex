defmodule College do

  filepath = "https://github.com/oreillymedia/etudes-for-elixir/blob/master/code/ch07-01/courses.csv"
  def make_room_list(filepath) do
    {outcome, device} = File.open(filepath, [:read, :utf8])
  end
end