class CreatePromotions < ActiveRecord::Migration[6.0]
  def change
    create_table :promotions do |t|
      t.string :keyword
      t.string :source
      t.date :expdate
      t.text :info
      t.integer :category, default: 0
      t.datetime :created_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.datetime :updated_at, default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
