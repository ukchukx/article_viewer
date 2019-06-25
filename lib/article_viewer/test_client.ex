defmodule ArticleViewer.TestClient do

  @articles [
    %{"title" => "Title #1"},
    %{"title" => "Title #2"},
    %{"title" => "Title #3"}
  ]

  @spec list_articles :: {:ok, list(map)}
  @spec search_articles(String.t) :: {:ok, list(map)}
  @spec get_article(integer) :: {:ok, map} | {:error, :not_found}


  def list_articles, do: {:ok, @articles}

  def search_articles(terms) do
    {:ok, Enum.filter(@articles, &search_fn(&1, terms))}
  end

  def get_article(id) when id <= 3, do: {:ok, Enum.at(@articles, id - 1)}

  def get_article(_), do: {:error, :not_found}

  defp search_fn(%{"title" => title}, terms) do
    terms =
      terms
      |> String.downcase
      |> String.trim

    title =
      title
      |> String.downcase
      |> String.trim

    String.contains?(title, terms)
  end
end
