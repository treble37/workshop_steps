defmodule TableProcessOne do
  def ping do
    # insert receive(args) here
    # once receive gets the message, it stops watching the mailbox
    receive do
      :ping -> IO.inspect("Hello :ping")
      _ -> "Error"
    end
  end

  def start do
    # insert spawn(fun) here
    spawn(&TableProcessOne.ping/0)
  end
end
