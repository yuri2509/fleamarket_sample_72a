class Cards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.references :user,       null: false, unique: true
      t.string :payjp,          null: false
      t.integer :card_id,       null: false, unique: true

      t.timestamps
    end
  end
end
