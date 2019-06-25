defmodule ArticleViewer.Web.PageController do
  use ArticleViewer.Web, :controller

  def index(conn, %{"terms" => terms}) do
    render conn, "index.html", articles: ArticleViewer.search_articles(terms), terms: terms
  end

  def index(conn, _) do
    render conn, "index.html", articles: ArticleViewer.list_articles(), terms: ""
  end

  def show(conn, %{"id" => id}) do
    render conn, "show.html", article: ArticleViewer.get_article(id)
  end
end
