class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.string :family_name,  null: false
      t.string :first_name,   null: false
      t.string :family_name_reading,  null: false
      t.string :first_name_reading,   null: false
      t.integer :post_code,   null: false
      t.integer :prefecture,  null: false
      t.string :city,         null: false
      t.string :address,      null: false
      t.string :building_name
      t.integer :phone_number, null: false, unique: true
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
