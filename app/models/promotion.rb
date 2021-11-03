class Promotion < ApplicationRecord
  enum category: { 'New User Only': 0, 'Refer Code': 1, Common: 2, Other: 3 }

  def self.all_categories
    ['New User Only', 'Refer Code', 'Common', 'Other']
  end
end
