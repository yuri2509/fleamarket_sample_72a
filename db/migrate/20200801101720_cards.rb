class Cards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.references :user,       null: false, unique: true
      t.string :customer_id,          null: false
      t.string :card_id,       null: false

      t.timestamps
    end
  end
end
