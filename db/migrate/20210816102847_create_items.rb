class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :introduction
      t.string :image_id
      t.integer :price
      t.boolean :is_sales_status

      t.timestamps
    end
    add_foreign_key :items, :gens
  end
end
