defmodule ArticleViewer.ArticleViewerTest do
  use ExUnit.Case, async: true

  test "list_articles returns a list" do
    assert is_list(ArticleViewer.list_articles())
  end

  test "get_article returns a map for existing articles" do
    assert is_map(ArticleViewer.get_article(3))
  end

  test "get_article returns nil for non-existent articles" do
    refute ArticleViewer.get_article(100)
  end
end
