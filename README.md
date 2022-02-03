# Stripe Checkout with Phoenix LiveView

This repo covers the 3 major steps to implementing Stripe Checkout in a Phoenix LiveView project.

1. Prepare your app to handle a Stripe webhook response
2. Triggering a Stripe Checkout
3. Managing prices from Stripe using GenServer

## Write-up / instructions

I wrote up a brief guide that goes alongside this repo, you can find that [here](https://www.stibbard.io/learning/elixir-phoenix-stripe-checkout)

## Getting started

1. Clone this repo with `git clone https://github.com/mstibbard/stripe_checkout_example.git` and `cd stripe_checkout_example`

2. Rename the `.env.example` file to `.env` and populate it with your Stripe keys

```
export STRIPE_SECRET=secret_here
export STRIPE_WEBHOOK_SIGNING_SECRET=whsec_secret_here
```

3. Within your test Stripe dashboard, create a Stripe product, price, and tax rate. This demo assumes you have a Stripe Price with a lookup_key of `"feature_item"` and a tax rate set up for Australia (i.e., country `"AU"`). If you already have other prices and tax rates set up, instead alter the code on `lib/stripe_checkout_example_web/live/page_live.ex`.

```elixir
{:ok, price_id} = StripeCache.get_price_id("put_your_lookup_key_here")
{:ok, tax_id} = StripeCache.get_tax_rate_id("put_your_country_code_here")
```

_Note_: If you decide NOT to use the StripeCache GenServer, remember to instead hardcode the Stripe price and tax rate IDs on `lib/stripe_checkout_example_web/live/page_live.ex`. You can refer to the prior commit to see this.

```elixir
price_id = "price_HARD_CODED_PRICE_HERE"
tax_id = "txr_HARD_CODED_TAX_HERE"
```

4. Run `mix deps.get && mix deps.compile`

5. Run `mix ecto.setup`

6. Run `mix phx.server` and visit `localhost:4000`
