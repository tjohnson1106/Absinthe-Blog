defmodule AbsintheBlogWeb.PageController do
  use AbsintheBlogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
