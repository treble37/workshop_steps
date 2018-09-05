defmodule TableServerFive do
  use GenServer

  # ----------------------------------------- #
  # Client - API                              #
  # i.e. Client calls the following functions #
  # ----------------------------------------- #
  def start_link(start_number, name) do
    # Call start_link with global server_name
    GenServer.start_link(__MODULE__, start_number, name: name)
  end

  def init(start_number) do
    {:ok, start_number}
  end

  def ping(name) do
    # Call global server_name with ping
    GenServer.call(name, :ping)
  end

  def pong(name) do
    # Call global server_name with pong
    GenServer.call(name, :pong)
  end

  # Add stop function

  def stop(name) do
    GenServer.stop(name)
  end

  # ----------------------------------------- #
  # Server - API                              #
  # i.e. Server calls the following functions #
  # ----------------------------------------- #
  def handle_call(:ping, _from, current_number) do
    {:reply, {:ok, current_number}, current_number + 1}
  end

  def handle_call(:pong, _from, current_number) do
    {:reply, {:ok, current_number}, current_number + 1}
  end
end
