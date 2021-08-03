defmodule Calculus do

  def derivative(func, point) do
    delta = 1.0e-10
    (func.(point + delta) - func.(point))/delta
  end

end