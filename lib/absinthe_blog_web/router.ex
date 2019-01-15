defmodule AbsintheBlogWeb.Router do
  use AbsintheBlogWeb, :router

  pipeline :graphql do
    plug AbsintheBlog.Context
  end

  scope "/api" do
    pipe_through(:graphql)

    forward("/", Absinthe.Plug, schema: AbsintheBlogWeb.Schema)
    forward("/graphiql", Absinthe.Plug.GraphiQL, schema: AbsintheBlogWeb.Schema)
  end
end
