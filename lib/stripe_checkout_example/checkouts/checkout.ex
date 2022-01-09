defmodule StripeCheckoutExample.Checkouts.Checkout do
  use Ecto.Schema
  import Ecto.Changeset

  schema "checkouts" do
    field :amount, :integer
    field :name, :string
    field :payment_intent_id, :string

    timestamps()
  end

  @doc false
  def changeset(checkout, attrs) do
    checkout
    |> cast(attrs, [:payment_intent_id, :amount, :name])
    |> validate_required([:payment_intent_id, :amount, :name])
  end
end
