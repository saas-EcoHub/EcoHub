class Promotion < ApplicationRecord
  enum category: { 'New User Only': 0, 'Refer Code': 1, Common: 2, Other: 3 }

  def self.all_categories
    ['New User Only', 'Refer Code', 'Common', 'Other']
  end

  def self.with_category(categories_array)
    # if categories_list is an array such as ['G', 'PG', 'R'], retrieve all
    #  movies with those categories
    # if categories_list is nil, retrieve ALL movies
    if categories_array.nil? || categories_array.length.zero?
      Promotion.all
    else
      categories_array.map { |a| categories[a] }
      Promotion.where(category: categories_array)
    end
  end
end
