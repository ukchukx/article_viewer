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

  test "search_articles returns a non-empty list when matches occur" do
    results = ArticleViewer.search_articles("title")

    assert is_list(results)
    refute 0 == length(results)
  end

  test "search_articles returns an empty list if no matches occur" do
    results = ArticleViewer.search_articles("dummy")

    assert is_list(results)
    assert 0 == length(results)
  end
end
