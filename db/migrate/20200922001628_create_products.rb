class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.integer :quantity
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
