use Mix.Config

# Configures the endpoint
config :article_viewer, ArticleViewer.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QTPWfjW/h6QP7WUEmE/cHhin6mxXf+uQ/PngzwMJ7TQIva4V9pgKpTYbwT/h+pXV",
  render_errors: [view: ArticleViewer.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ArticleViewer.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:all]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :article_viewer, :elevio,
  url: "https://api.elev.io/v1/",
  key: System.get_env("ELEVIO_KEY"),
  token: System.get_env("ELEVIO_TOKEN")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
