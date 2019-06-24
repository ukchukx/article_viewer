# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :article_viewer, ArticleViewerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QTPWfjW/h6QP7WUEmE/cHhin6mxXf+uQ/PngzwMJ7TQIva4V9pgKpTYbwT/h+pXV",
  render_errors: [view: ArticleViewerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ArticleViewer.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:all]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
