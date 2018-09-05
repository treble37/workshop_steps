defmodule TableServerThree do
  use GenServer

  # ----------------------------------------- #
  # Client - API                              #
  # i.e. Client calls the following functions #
  # ----------------------------------------- #
  def start_link(arg_num) do
    # start link with initial value
    GenServer.start_link(__MODULE__, arg_num, name: __MODULE__)
  end

  def init(args) do
    {:ok, args}
  end

  def ping() do
    GenServer.call(__MODULE__, :ping)
  end

  def pong() do
    GenServer.call(__MODULE__, :pong)
  end

  # Be sure to setup a pong()

  # ----------------------------------------- #
  # Server - API                              #
  # i.e. Server calls the following functions #
  # ----------------------------------------- #
  def handle_call(:ping, _from, current_number) do
    {:reply, {:ok, current_number}, current_number}
  end

  # pong handler goes here
  def handle_call(:pong, _from, current_number) do
    {:reply, {:ok, current_number}, current_number}
  end
end
