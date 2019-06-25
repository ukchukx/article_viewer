use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :article_viewer, ArticleViewer.Web.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :article_viewer, env: :test

config :article_viewer, :elevio,
  client: ArticleViewer.TestClient
