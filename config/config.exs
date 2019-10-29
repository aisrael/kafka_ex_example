use Mix.Config

config :hello, test: %{foo: "bar"}

config :kafka_ex, brokers: [{"localhost", 9092}]

env_logger_level = String.downcase(System.get_env("ELIXIR_LOGGER_LEVEL", "info"))

level =
  level =
  %{
    "1" => :debug,
    "3" => :warn,
    "debug" => :debug,
    "warn" => :warn
  }
  |> Map.get(env_logger_level, :info)

config :logger, :console,
  level: level,
  format: "[$level] $levelpad$metadata $message\n",
  metadata: [:pid]
