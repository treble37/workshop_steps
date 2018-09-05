defmodule TableProcessTwo do
  def ping do
    # insert receive here
    receive do
      :ping -> IO.puts("received ping")
    end

    ping()
  end

  def start do
    # insert spawn here
    spawn(__MODULE__, :ping, [])
  end
end
