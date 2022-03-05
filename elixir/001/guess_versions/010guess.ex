defmodule Guess do
  use Application

  def start(_,_) do
    run()
    {:ok, self()}
  end

  def run() do
    IO.puts("Let's play Guess the Number")

    IO.gets("Pick a difficult level (1, 2 or 3):")
    |> parse_input()
    |> pickup_number()
    |> play()
    |> IO.inspect()
  end

  def parse_input(:error) do
    IO.puts("Invalid input!!!")
    run()
  end

  def parse_input({num, _}), do: num

  def parse_input(data) do
    data 
    |> Integer.parse()
    |> parse_input()
  end

  def pickup_number(level) do
    level
    |> get_range()
    |> Enum.random()
  end

  def get_range(level) do
    case level do
      1 -> 1..10
      2 -> 1..100
      3 -> 1..1000
      _ -> IO.puts("Invalid level!!!")
        run()
    end
  end

  def play(picked_num) do
    IO.gets("I have my number. What is your guess?")
    |> parse_input()
    |> guess(picked_num)
  end


  def guess(usr_guess, picked_num) when usr_guess > picked_num do 
    IO.gets("Too high. Guess again:")
    |> parse_input()
    |> guess(picked_num)
  end

  def guess(usr_guess, picked_num) when usr_guess < picked_num do 
    IO.gets("Too low. Guess again:")
    |> parse_input()
    |> guess(picked_num)
  end

  def guess(_usr_guess, _picked_num) do 
    IO.puts("You got it")
  end
end
