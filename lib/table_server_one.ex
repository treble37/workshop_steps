defmodule TableServerOne do
  use GenServer

  def init(args) do
    # init
    {:ok, args}
  end

  def handle_call(:ping, _from, []) do
    # handle call and setup for next call
    {:reply, {:ok}, []}
  end
end
