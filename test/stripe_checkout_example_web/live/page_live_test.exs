defmodule StripeCheckoutExampleWeb.PageLiveTest do
  use StripeCheckoutExampleWeb.ConnCase

  import Phoenix.LiveViewTest

  describe "Index" do
    test "shows heading", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.page_path(conn, :index))

      assert html =~ "LiveView-based Checkout trigger"
    end
  end
end
