class AddConstraintsToPromotions < ActiveRecord::Migration[6.0]
  def change
    change_table :promotions do |t|
      t.belongs_to :user, foreign_key: true
    end
  end
end
