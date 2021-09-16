class CreateWebinars < ActiveRecord::Migration[6.1]
  def change
    create_table :webinars do |t|
      t.string :title
      t.integer :subscribers
      t.date :startdate

      t.timestamps
    end
  end
end
