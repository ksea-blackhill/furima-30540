class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,     null: false
      t.integer    :area_id,         null: false
      t.string     :municipality,    null: false
      t.string     :banchi,          null: false
      t.string     :building
      t.string     :tel,             null: false
      t.references :payment,        foreign_key: true
      t.timestamps
    end
  end
end
