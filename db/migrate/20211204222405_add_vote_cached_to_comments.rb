class AddVoteCachedToComments < ActiveRecord::Migration[6.0]
  def change
    change_table :comments do |t|
      t.column :cached_votes_total, :integer, default: 0
      t.column :cached_votes_score, :integer, default: 0
      t.column :cached_votes_up, :integer, default: 0
      t.column :cached_votes_down, :integer, default: 0
      t.column :cached_weighted_score, :integer, default: 0
      t.column :cached_weighted_total, :integer, default: 0
      t.column :cached_weighted_average, :float, default: 0.0

      Comment.find_each(&:update_cached_votes)
    end
  end
end
