defmodule ArticleViewerWeb.PageController do
  use ArticleViewerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
