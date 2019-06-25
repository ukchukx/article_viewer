defmodule ArticleViewer do
  @moduledoc """
  ArticleViewer keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  @client  Application.get_env(:article_viewer, :elevio)[:client]

  def list_articles do
    case @client.list_articles() do
      {:ok, articles} -> articles
      {:error, _} -> []
    end
  end
