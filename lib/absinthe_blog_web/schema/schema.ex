defmodule AbsintheBlogWeb.Schema do
  use Absinthe.Schema
  import_types(AbsintheBlogWeb.Schema.Types)

  query do
    field :blog_posts, list_of(:blog_post) do
      resolve(&AbsintheBlogWeb.PostResolver.all/2)
    end

    field :blog_post, type: :blog_post do
      arg(:id, non_null(:id))
      resolve(&AbsintheBlogWeb.Accounts.PostResolver.find/2)
    end

    field :accounts_user, list_of(:accounts_user) do
      resolve(&AbsintheBlogWeb.Accounts.UserResolver.all/2)
    end

    field :accounts_user, :accounts_user do
      arg(:email, non_null(:string))
      resolve(&AbsintheBlogWeb.Accounts.UserResolver.find/2)
    end
  end
end
