defmodule StripeCheckoutExample.CheckoutsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StripeCheckoutExample.Checkouts` context.
  """

  @doc """
  Generate a checkout.
  """
  def checkout_fixture(attrs \\ %{}) do
    {:ok, checkout} =
      attrs
      |> Enum.into(%{
        amount: 42,
        name: "some name",
        payment_intent_id: "some payment_intent_id"
      })
      |> StripeCheckoutExample.Checkouts.create_checkout()

    checkout
  end
end
