class AddOwnerToWebinars < ActiveRecord::Migration[6.1]
  def change
    add_column :webinars, :owner, :string
  end
end
