defmodule ArticleViewer.ElevioClient do

  @api_key Application.get_env(:article_viewer, :elevio)[:key]
  @token Application.get_env(:article_viewer, :elevio)[:token]
  @url Application.get_env(:article_viewer, :elevio)[:url]

  @spec list_articles :: {:ok, list} | {:error, atom}
  def list_articles do
    try do
      HTTPotion.get("#{@url}articles", [
        headers: ["x-api-key": @api_key, "Authorization": "Bearer " <> @token],
        timeout: 10_000
      ])
      |> case do
        %HTTPotion.Response{body: body} ->
          articles =
            body
            |> Jason.decode!
            |> Map.get("articles", [])

          {:ok, articles}

        _ -> {:error, :could_not_fetch}
      end
    rescue
      _ -> {:error, :could_not_fetch}
    end
  end
        _ -> {:error, :could_not_fetch}
      end
    rescue
      _ -> {:error, :could_not_fetch}
    end
  end
end
