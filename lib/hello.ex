defmodule Hello do
  @moduledoc """
  Documentation for Hello.
  """

  alias KafkaEx.Protocol.Produce.{Message, Request}

  require Logger

  @topic "example_topic"

  @doc """
  Send a message to Kafka using KafkaEx.
  """
  def publish(s, key \\ nil) do
    message = %Message{
      key: key || s,
      value: s
    }

    request = %Request{
      topic: @topic,
      messages: [message]
    }

    Logger.debug("KafkaEx.produce(#{inspect(request)})")

    result = KafkaEx.produce(request)

    Logger.debug("KafkaEx.produce(request) => #{inspect(result)}")
  end
end
