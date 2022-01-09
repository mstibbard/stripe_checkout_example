defmodule StripeCheckoutExample.Repo.Migrations.CreateCheckouts do
  use Ecto.Migration

  def change do
    create table(:checkouts) do
      add :payment_intent_id, :string
      add :amount, :integer
      add :name, :string

      timestamps()
    end
  end
end
