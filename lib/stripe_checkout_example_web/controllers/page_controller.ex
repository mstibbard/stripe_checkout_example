defmodule StripeCheckoutExampleWeb.PageController do
  use StripeCheckoutExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
