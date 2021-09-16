class ChangePriceToInt < ActiveRecord::Migration[6.1]
  def change
    remove_column :webinars, :price
    add_column :webinars, :price, :integer
  end
end
