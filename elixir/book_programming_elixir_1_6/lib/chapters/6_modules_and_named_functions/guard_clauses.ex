defmodule Chop do
  @doc """
  Exercise: ModulesAndFunctions-6
  I’m thinking of a number between 1 and 1000....
  The most efficient way to find the number is to guess halfway between
  the low and high numbers of the range. If our guess is too big, then the
  answer lies between the bottom of the range and one less than our guess.
  If our guess is too small, then the answer lies between one more than our
  guess and the end of the range.
  Your API will be guess(actual, range) , where range is an Elixir range. Your
  output should look similar to this:

      iex> Chop.guess(273, 1..1000)
      Is it 500
      Is it 250
      Is it 375
      Is it 312
      Is it 281
      Is it 265
      Is it 273
      273
  """
  def guess(prediction, bottom..top = range)
      when bottom > 0 and top > 0 and prediction == div(bottom + top, 2) do
    "It is #{halfway(range)}"
  end

  def guess(prediction, bottom..top = range)
      when bottom > 0 and top > 0 and prediction < div(bottom + top, 2) do
    IO.puts("It is #{halfway(range)}")
    guess(prediction, bottom..(halfway(range) - 1))
  end

  def guess(prediction, bottom..top = range)
      when bottom > 0 and top > 0 and prediction > div(bottom + top, 2) do
    IO.puts("It is #{halfway(range)}")
    guess(prediction, (halfway(range) + 1)..top)
  end

  defp halfway(bottom..top), do: div(bottom + top, 2)
end
