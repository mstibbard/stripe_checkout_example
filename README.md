# Stripe Checkout with Phoenix LiveView

This repo covers the 3 major steps to implementing Stripe Checkout

1. Prepare your app to handle a Stripe webhook response
2. Triggering a Stripe Checkout
3. **TO DO**: Managing prices from Stripe

## Write-up / instructions

I wrote up a brief guide that goes alongside this repo, you can find that [here](https://www.stibbard.io/learning/elixir-phoenix-stripe-checkout)

## Getting started

1. Clone this repo with `git clone https://github.com/mstibbard/stripe_checkout_example.git` and `cd stripe_checkout_example`

2. Rename the `.env.example` file to `.env` and populate it with your Stripe keys

```
export STRIPE_SECRET=secret_here
export STRIPE_WEBHOOK_SIGNING_SECRET=whsec_secret_here
```

3. **Temporary step until price management implemented**: Add your price_id and tax_ids from Stripe in the following lines of `lib/stripe_checkout_example_web/live/page_live.ex`

```elixir
price_id = "price_HARD_CODED_PRICE_HERE"
tax_id = "txr_HARD_CODED_TAX_HERE"
```

4. Run `mix deps.get && mix deps.compile`

5. Run `mix ecto.setup`

6. Run `mix phx.server` and visit `localhost:4000`
