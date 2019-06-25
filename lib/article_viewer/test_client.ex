defmodule ArticleViewer.TestClient do

  @articles [
    %{"title" => "Title #1"},
    %{"title" => "Title #2"},
    %{"title" => "Title #3"}
  ]

  @spec list_articles :: {:ok, list(map)}
  @spec get_article(integer) :: {:ok, map} | {:error, :not_found}


  def list_articles, do: {:ok, @articles}

  def get_article(id) when id <= 3, do: {:ok, Enum.at(@articles, id - 1)}

  def get_article(_), do: {:error, :not_found}
end
