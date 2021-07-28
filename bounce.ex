defmodule Bouncingball do

  def bouncing_ball(h, bounce, window) when (h>0 and bounce>0 and bounce<1 and window<h) do
    # t your code
    find_n(h, bounce, window, 1)
  end
  
  def bouncing_ball(_h, _bounce, _window) do
    -1
  end

  def find_n(h, bounce, window, count) do
    #IO.puts("The height is #{h}, the count is #{count}")
    cond do
      window < h * bounce -> find_n(h * bounce, bounce, window, count + 2)
      true -> count
    end
  end
  
end