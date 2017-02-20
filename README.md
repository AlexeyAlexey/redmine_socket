# RedmineSocket (https://github.com/AlexeyAlexey/redmine_phoenix_socket/tree/develop)

App is used as ws server by [redmine_phoenix_socket](https://github.com/AlexeyAlexey/redmine_phoenix_socket) that is redmine plugin

Connecting with redmine app

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix


We are all set! Run your Phoenix application:

    $ cd redmine_socket
    $ mix phoenix.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phoenix.server

Before moving on, configure your database in config/dev.exs and run:

    $ mix ecto.create




Could not check origin for Phoenix.Socket transport.

        This happens when you are attempting a socket connection to
        a different host than the one configured in your config/
        files. For example, in development the host is configured
        to "localhost" but you may be trying to access it from
        "127.0.0.1". To fix this issue, you may either:

          1. update [url: [host: ...]] to your actual host in the
             config file for your current environment (recommended)

          2. pass the :check_origin option when configuring your
             endpoint or when configuring the transport in your
             UserSocket module, explicitly outlining which origins
             are allowed:

                check_origin: ["https://example.com",
                               "//another.com:888", "//other.com"]
        """

# web/channels/user_socket.ex
defmodule ExPusherLite.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "*", ExPusherLite.RoomChannel

  ## Transports
  transport :websocket, Phoenix.Transports.WebSocket, check_origin: false
  ...


  The `channel` macro accepts topic patterns in two flavors. A splat argument
  can be provided as the last character to indicate a "topic:subtopic" match. If
  a plain string is provied, only that topic will match the channel handler.
  Most use-cases will use the "topic:*" pattern to allow more versatile topic
  scoping.

  See `Phoenix.Channel` for more information


  defmodule Phoenix.Channel do 
  defmodule Phoenix.Channel.Server do 
  defmodule Phoenix.Socket.Message do 
  defmodule Phoenix.Socket do
  defmodule Phoenix.Socket.Transport do 





https://groups.google.com/forum/#!topic/phoenix-talk/zjwitSVACUc

  So Phoenix channels sit atop Phoenix.PubSub, which is a distributed pubsub system. When deployed on a cluster of machines, multinode broadcasts Just Work. You don’t have to configure anything. `broadcast socket, “foo:bar”, %{…}` will be delivered to all nodes for you (provided they are connected to the cluster). If not using distributed elixir to connect, nodes, you can make a one-line config change to use the Phoenix.PubSub.Redis adapter and redis will distribute the pubsub across your nodes. So if you are using channels, you load balance http across multiple phoenix nodes and pubsub takes care of the rest. Now, this is only for distributed PubSub. When you are talking about using Agent, GenServers, or registered processes in a distribute system, you need to make other considerations, but this applies to Elixir in general, not Phoenix. Hope that helps.

Chris




(Running Elixir and Phoenix projects on a cluster of nodes) https://dockyard.com/blog/2016/01/28/running-elixir-and-phoenix-projects-on-a-cluster-of-nodes

key_digest

http://www.phoenixframework.org/docs/advanced-deployment