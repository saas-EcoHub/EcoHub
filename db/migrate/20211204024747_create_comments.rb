class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :parent_id
      t.belongs_to :user, foreign_keys: true
      t.belongs_to :promotion, foreign_keys: true
      t.timestamps
    end
  end
end
