defmodule TableSupervisorFour do
  # Automatically defines child_spec/1
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  def init(_arg) do
    # Initialize children here

    # Now we start the supervisor with the children and a strategy
    # Syntax 1:
    children = [{TableServerFour, 0}]
    Supervisor.init(children, strategy: :one_for_one)
    # Syntax 2 (this is an old syntax):
    # children = [worker(TableServerFour, [0])]
    # supervise(children, strategy: :one_for_one)
  end
end
