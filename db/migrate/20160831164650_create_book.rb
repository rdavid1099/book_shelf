class CreateBook < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.text :title
      t.decimal :price
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
