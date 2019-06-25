defmodule ArticleViewer.ArticleViewerTest do
  use ExUnit.Case, async: true

  @client  Application.get_env(:article_viewer, :elevio)[:client]

  test "list_articles returns a list" do
    assert is_list(@client.list_articles())
  end
end
