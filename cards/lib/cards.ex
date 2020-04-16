defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.create_deck()
      ["Ace", "Two", "Three"]

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits do
      for value <- values do
       Enum.join([value, suit], " of ")
      end
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains(deck, card) do 
    Enum.member?(deck, card) 
  end
end
