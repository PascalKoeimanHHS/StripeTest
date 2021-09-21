class AddStripeProductIdToWebinars < ActiveRecord::Migration[6.1]
  def change
    add_column :webinars, :stripe_product_id, :string
  end
end
