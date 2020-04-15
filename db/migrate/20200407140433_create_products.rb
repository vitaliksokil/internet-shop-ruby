class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.string :img
      t.integer :price

      t.timestamps
    end
  end
end
