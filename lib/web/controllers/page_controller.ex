defmodule ArticleViewer.Web.PageController do
  use ArticleViewer.Web, :controller

  def index(conn, _) do
    render conn, "index.html", articles: ArticleViewer.list_articles()
  end

  def show(conn, %{"id" => id}) do
    render conn, "show.html", article: ArticleViewer.get_article(id)
  end
end
