defmodule ArticleViewer.Repo do
  use Ecto.Repo,
    otp_app: :article_viewer,
    adapter: Ecto.Adapters.Postgres
end
