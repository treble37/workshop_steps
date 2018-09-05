defmodule TableProcessThree do
  def ping do
    receive do
      # Receive a ping, send a pong
      {pid, :ping} ->
        IO.inspect("Got ping, here's a pong")
        send(pid, {self(), :pong})
    end

    ping()
  end

  def pong do
    # Receive a pong, send a ping
    receive do
      {pid, :pong} ->
        IO.inspect("Got pong, here's a ping")
        send(pid, {self(), :ping})
    end

    pong()
  end

  def start do
    # spawn two processes and return both process ids
    ping_pid = spawn(__MODULE__, :ping, [])
    pong_pid = spawn(__MODULE__, :pong, [])
    {ping_pid, pong_pid}
  end
end
