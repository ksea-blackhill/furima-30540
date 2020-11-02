class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :user,foreign_key: true ,null: false
      t.references :item,foreign_key: true ,dependent: :destroy
      t.timestamps
    end
  end
end
