defmodule VcrWeb.Router do
  use VcrWeb, :router

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

  scope "/", VcrWeb do
    pipe_through :browser # Use the default browser stack

    resources "/recommendations", RecommendationController

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", VcrWeb do
  #   pipe_through :api
  # end
end
