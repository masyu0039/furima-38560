class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.references :credential,      null: false, foreign_key: true
      t.string     :postal_code,     null: false
      t.integer    :prefecture_id,   null: false
      t.string     :city,            null: false
      t.string     :address,         null: false
      t.string     :building_name
      t.string     :phone,           null: false
      t.timestamps
    end
  end
end
