defmodule StripeCheckoutExample.Repo do
  use Ecto.Repo,
    otp_app: :stripe_checkout_example,
    adapter: Ecto.Adapters.Postgres
end
