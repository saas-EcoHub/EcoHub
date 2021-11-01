class CreatePromotions < ActiveRecord::Migration[6.0]
  def change
    create_table :promotions do |t|
      t.string :keyword
      t.string :source
      t.string :kind
      t.datetime :expdate
      t.text :info

      t.timestamps
    end
  end
end
