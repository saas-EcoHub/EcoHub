class AddConstraintsToPromotions < ActiveRecord::Migration[6.0]
  def change
    change_table :promotions do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :cached_votes_total, default: 0
      t.integer :cached_votes_score, default: 0
      t.integer :cached_votes_up, default: 0
      t.integer :cached_votes_down, default: 0
      t.integer :cached_weighted_score, default: 0
      t.integer :cached_weighted_total, default: 0
      t.float :cached_weighted_average, default: 0.0
    end
  end
end
