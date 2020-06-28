class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :integer
      t.text :description
      t.string :status
      t.text :judgment
      t.integer :size
      t.string :cost
      t.string :days
      # テーブルを作ってから
      # t.integer :prefecture, foreign_key: true
      # t.references :category, foreign_key: true
      # t.references :brand, foreign_key: true
      # t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
