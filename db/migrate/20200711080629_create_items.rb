class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name,            null: false
      t.string :status,          null: false
      t.string :cost,            null: false
      t.string :day,             null: false
      t.integer :price,          null: false
      t.text :description,       null: false
      t.text :judgment
      t.text :brand  
      t.integer :prefecture_id,     null: false
      t.references :category,    null: false, foreign_key: true
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
