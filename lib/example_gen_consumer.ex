defmodule ExampleGenConsumer do
  use KafkaEx.GenConsumer

  alias KafkaEx.Protocol.Fetch.Message

  require Logger

  @spec init(String.t(), String.t()) :: {:ok, any()}
  def init(topic, partition) do
    Logger.info(~s[#{__MODULE__}.init("#{topic}", #{partition})])
    {:ok, partition}
  end

  # note - messages are delivered in batches
  def handle_message_set(message_set, partition) do
    for %Message{value: message} <- message_set do
      Logger.info("[partition: #{partition}] message: " <> inspect(message))
    end

    {:async_commit, partition}
  end
end
