defmodule StripeCheckoutExampleWeb.PageLive do
  use StripeCheckoutExampleWeb, :live_view

  alias StripeCheckoutExample.{Checkouts, StripeCache}

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(checkouts: Checkouts.list_checkouts())

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Stripe Checkout example")
    |> assign(:items, ["Alpha", "Bravo", "Charlie"])
  end

  @impl true
  def handle_event("checkout", %{"id" => id}, socket) do
    send(self(), {:create_payment_intent, id: id})

    {:noreply, socket}
  end

  @impl true
  def handle_info({:create_payment_intent, id: id}, socket) do
    {:ok, price_id} = StripeCache.get_price_id("feature-item")
    {:ok, tax_id} = StripeCache.get_tax_rate_id("AU")
    url = StripeCheckoutExampleWeb.Endpoint.url()

    create_params = %{
      cancel_url: url,
      success_url: url,
      payment_method_types: ["card"],
      mode: "payment",
      metadata: [name: id],
      line_items: [
        %{
          price: price_id,
          quantity: 1,
          tax_rates: [tax_id]
        }
      ]
    }

    case Stripe.Session.create(create_params) do
      {:ok, session} ->
        {:noreply, redirect(socket, external: session.url)}

      {:error, error} ->
        IO.inspect(error)
        {:noreply, socket}
    end
  end
end
