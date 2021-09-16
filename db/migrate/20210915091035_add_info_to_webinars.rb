class AddInfoToWebinars < ActiveRecord::Migration[6.1]
  def change
    add_column :webinars, :price, :decimal
    add_column :webinars, :body, :text
  end
end
