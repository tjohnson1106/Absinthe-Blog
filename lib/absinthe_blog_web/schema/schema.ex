defmodule AbsintheBlogWeb.Schema do
  use Absinthe.Schema
  import_types(AbsintheBlogWeb.Schema.Types)

  query do
    field :blog_posts, list_of(:blog_post) do
      resolve(&AbsintheBlogWeb.Blog.PostResolver.all/2)
    end

    field :blog_post, type: :blog_post do
      arg(:id, non_null(:id))
      resolve(&AbsintheBlogWeb.Accounts.Blog.PostResolver.find/2)
    end

    field :accounts_user, list_of(:accounts_user) do
      resolve(&AbsintheBlogWeb.Accounts.Blog.UserResolver.all/2)
    end

    field :accounts_user, :accounts_user do
      arg(:email, non_null(:string))
      resolve(&AbsintheBlogWeb.Accounts.Blog.UserResolver.find/2)
    end

    mutation do
      field :create_post, type: :blog_post do
        arg(:title, non_null(:string))
        arg(:body, non_null(:string))
        arg(:accounts_user_id, non_null(:id))

        resolve(&AbsintheBlogWeb.Blog.PostResolver.create/2)
      end

      field :update_post, type: :blog_post do
        arg(:id, non_null(:id))
        arg(:post, :update_post_params)

        resolve(&AbsintheBlogWeb.Blog.PostResolver.update/2)
      end

      field :delete_post, type: :blog_post do
        arg(:id, non_null(:id))
        resolve(&AbsintheBlogWeb.Blog.PostResolver.delete/2)
      end
    end
  end
end
