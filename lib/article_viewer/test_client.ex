defmodule ArticleViewer.TestClient do

  @articles [
    %{"title" => "Title #1"},
    %{"title" => "Title #2"},
    %{"title" => "Title #3"}
  ]

  @spec list_articles :: {:ok, list}
  def list_articles, do: {:ok, @articles}
end
