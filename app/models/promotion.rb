class Promotion < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :comments, -> { order('cached_weighted_score DESC') }, dependent: :destroy

  enum category: { 'New User Only': 0, 'Refer Code': 1, Common: 2, Other: 3 }

  def self.all_categories
    ['New User Only', 'Refer Code', 'Common', 'Other']
  end
end
