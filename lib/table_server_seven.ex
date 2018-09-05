defmodule TableServerSeven do
  use GenServer

  # ----------------------------------------- #
  # Client - API                              #
  # i.e. Client calls the following functions #
  # ----------------------------------------- #
  def start_link([start_number, end_number], server_name) do
    # Need to handle both a start_number and an end_number
    GenServer.start_link(
      __MODULE__,
      [start_number - 1, end_number, start_number],
      name: global_server_name(server_name)
    )
  end

  def init([start_number, end_number, current] = args) do
    # Need to handle both a start_number and an end_number
    {:ok, args}
  end

  def stop(server_name) do
    GenServer.stop(global_server_name(server_name))
  end

  def ping(server_name) do
    try_call(server_name, :ping)
  end

  def pong(server_name) do
    try_call(server_name, :pong)
  end

  # ----------------------------------------- #
  # Server - API                              #
  # i.e. Server calls the following functions #
  # ----------------------------------------- #
  def handle_call(:ping, _from, current_numbers) do
    # Need to handle both a start_number and an end_number
    [start_num, end_num, current] = current_numbers
    {:reply, {:ok, current}, [start_num, end_num, Enum.min([end_num, current + 1])]}
  end

  def handle_call(:pong, _from, current_numbers) do
    # Need to handle both a start_number and an end_number
    [start_num, end_num, current] = current_numbers
    {:reply, {:ok, current}, [start_num, end_num, Enum.min([end_num, current + 1])]}
  end

  defp global_server_name(server_name) do
    {:global, {:servername, server_name}}
  end

  defp try_call(server_name, message) do
    case GenServer.whereis(global_server_name(server_name)) do
      nil ->
        {:error, :invalid_server}

      servername ->
        GenServer.call(servername, message)
    end
  end
end
