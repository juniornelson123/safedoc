defmodule SafedocWeb.Router do
  use SafedocWeb, :router

  pipeline :auth do
    plug Safedoc.Account.Pipeline
  end

  # We use ensure_auth to fail if there is no one logged in
  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

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

  scope "/", SafedocWeb do
    pipe_through :browser

    get "/login", SessionController, :new
    post "/login", SessionController, :login
    delete "/logout", SessionController, :logout
  end

  scope "/", SafedocWeb do
    pipe_through [:browser, :auth, :ensure_auth]

    get "/", PageController, :index
    resources "/categorias", CategoryController
    resources "/colaboradores", CollaboratorController
    resources "/recipientes", ContainerController
    resources "/clientes", CustomerController do
      resources "/documentos", Customer.DocumentController do
        resources "/indexadores", Customer.Document.IndexerDataController
      end
    end
    resources "/servicos", ServiceController
    resources "/funcoes", OccupationController
    resources "/passos", StepController
    resources "/atividades", ActivityController do
      resources "/indexadores", IndexerController
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", SafedocWeb do
  #   pipe_through :api
  # end
end
