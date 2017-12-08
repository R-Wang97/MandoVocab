defmodule Mandovocab do
  def main(_args) do
    IO.puts("Starting script")

    words = read_file()
    |> parse_file()
  end

  def read_file do
    IO.puts("Reading text file")

    case File.read("vocab.txt") do
      {:ok, body}
        -> body
      {:error, _reason}
        -> IO.puts("Error reading file.")
          []
    end
  end

  def parse_file(text) do
    IO.puts("Creating list of words")
  end

  def parse_file([]) do
  end


  @moduledoc """
  Documentation for Mandovocab.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Mandovocab.hello
      :world

  """
  def hello do
    :world
  end
end
