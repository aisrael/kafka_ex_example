# KafkaEx.GenConsumer and ConsumerGroup

This repository contains a "minimum reproducible example" demonstrating [kafka_ex](https://github.com/kafkaex/kafka_ex), in particular `KafkaEx.GenConsumer` and `KafkaEx.ConsumerGroup`.

### Requirements

* [Docker](https://docs.docker.com/install/) and Docker Compose

### Usage

#### Start Kafka

First, start the test Kafka service using Docker Compose:

```
$ docker-compose up
```

#### Start the application

Wait for the Kafka service to become ready, then you can start the application using `iex`:

```
$ iex -S mix
Erlang/OTP 22 [erts-10.4.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe]

Interactive Elixir (1.9.1) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> [info]  pid=<0.188.0>  Elixir.ExampleGenConsumer.init("example_topic", 0)
[info]  pid=<0.190.0>  Elixir.ExampleGenConsumer.init("example_topic", 1)
```

This shows that the application started successfully under `iex`.

#### Publish a test message

We can now send a test message using `Hello.publish`:

```
iex(2)> Hello.publish("test")
:ok
iex(3)> [info]  pid=<0.197.0>  [partition: 0] message: "test"
```

Optionally, you can specify the message key (which affects which partition receives the message) with:

```
iex(4)> Hello.publish("test", "1")
:ok
iex(5)> [info]  pid=<0.199.0>  [partition: 1] message: "test"
```

#### Running a second instance of the application

In another terminal or tab, attempt to run a second instance of the app using:

```
$ mix run --no-halt
```

