defmodule AbsintheBlog.Repo do
  use Ecto.Repo,
    otp_app: :absinthe_blog,
    adapter: Ecto.Adapters.Postgres
end
