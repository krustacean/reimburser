class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :asin
      t.string :upc
      t.date :start_date
      t.date :end_date
      t.float :target_price
      t.boolean :completed
      t.boolean :expired
      t.float :purchase_price
      t.float :current_price
      t.string :formatted_price
      t.references :user
      t.timestamps null: false
      t.string :name
      t.string :listing_url
      t.string :image_url
    end
  end
end
