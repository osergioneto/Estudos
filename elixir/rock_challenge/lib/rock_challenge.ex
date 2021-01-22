defmodule RockChallenge do
  @moduledoc """
  Documentation for `RockChallenge`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> RockChallenge.hello()
      :world

  """
  def hello do
    :world
  end

  def sum_prices(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({ok, array}) do
    IO.puts(array)
    result =
      array
      |> Enum.map(fn item -> IO.puts(item) end)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}
end
