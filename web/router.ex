defmodule UnfSwuber.Router do
  use UnfSwuber.Web, :router

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

  scope "/", UnfSwuber do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/chat", ChatController, :index
    get "/maps", MapController, :index
    get "/about", AboutController, :index
    get "/contact", ContactController, :index
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", UnfSwuber do
  #   pipe_through :api
  # end
end
