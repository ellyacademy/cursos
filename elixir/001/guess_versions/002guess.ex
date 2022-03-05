defmodule Guess do
  use Application

  def start(_,_) do
    run()
    {:ok, self()}
  end

  def run() do
    IO.puts("Let's play Guess the Number")
  end
end
