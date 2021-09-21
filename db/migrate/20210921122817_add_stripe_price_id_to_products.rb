class AddStripePriceIdToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :webinars, :stripe_price_id, :string
  end
end
