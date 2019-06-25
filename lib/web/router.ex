defmodule ArticleViewer.Web.Router do
  use ArticleViewer.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ArticleViewer.Web do
    pipe_through :browser

    get "/", PageController, :index
    get "/:id", PageController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", ArticleViewer.Web do
  #   pipe_through :api
  # end
end
