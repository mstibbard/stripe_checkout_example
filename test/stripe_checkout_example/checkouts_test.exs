defmodule StripeCheckoutExample.CheckoutsTest do
  use StripeCheckoutExample.DataCase

  alias StripeCheckoutExample.Checkouts

  describe "checkouts" do
    alias StripeCheckoutExample.Checkouts.Checkout

    import StripeCheckoutExample.CheckoutsFixtures

    @invalid_attrs %{amount: nil, name: nil, payment_intent_id: nil}

    test "list_checkouts/0 returns all checkouts" do
      checkout = checkout_fixture()
      assert Checkouts.list_checkouts() == [checkout]
    end

    test "get_checkout!/1 returns the checkout with given id" do
      checkout = checkout_fixture()
      assert Checkouts.get_checkout!(checkout.id) == checkout
    end

    test "create_checkout/1 with valid data creates a checkout" do
      valid_attrs = %{amount: 42, name: "some name", payment_intent_id: "some payment_intent_id"}

      assert {:ok, %Checkout{} = checkout} = Checkouts.create_checkout(valid_attrs)
      assert checkout.amount == 42
      assert checkout.name == "some name"
      assert checkout.payment_intent_id == "some payment_intent_id"
    end

    test "create_checkout/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Checkouts.create_checkout(@invalid_attrs)
    end

    test "update_checkout/2 with valid data updates the checkout" do
      checkout = checkout_fixture()

      update_attrs = %{
        amount: 43,
        name: "some updated name",
        payment_intent_id: "some updated payment_intent_id"
      }

      assert {:ok, %Checkout{} = checkout} = Checkouts.update_checkout(checkout, update_attrs)
      assert checkout.amount == 43
      assert checkout.name == "some updated name"
      assert checkout.payment_intent_id == "some updated payment_intent_id"
    end

    test "update_checkout/2 with invalid data returns error changeset" do
      checkout = checkout_fixture()
      assert {:error, %Ecto.Changeset{}} = Checkouts.update_checkout(checkout, @invalid_attrs)
      assert checkout == Checkouts.get_checkout!(checkout.id)
    end

    test "delete_checkout/1 deletes the checkout" do
      checkout = checkout_fixture()
      assert {:ok, %Checkout{}} = Checkouts.delete_checkout(checkout)
      assert_raise Ecto.NoResultsError, fn -> Checkouts.get_checkout!(checkout.id) end
    end

    test "change_checkout/1 returns a checkout changeset" do
      checkout = checkout_fixture()
      assert %Ecto.Changeset{} = Checkouts.change_checkout(checkout)
    end
  end
end
