# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

promos = [{ keyword: '$35 off for order over $45', source: 'BuyK', upvotes: 20, info: 'This is 1' },
          { keyword: '$20 off for order over $21', source: 'Gorillas', category: 1, upvotes: 26, info: 'This is 2' },
          { keyword: '10% off for the first order', source: 'Ebay', upvotes: 12, info: 'This is 3' },
          { keyword: '$30 off for order over $50', source: 'Instcart', upvotes: 15, info: 'This is 4' },
          { keyword: '$100 for free', source: 'Peach', category: 3, upvotes: 30, info: 'This is 5', expdate: '2021-11-03' },
          { keyword: '$20 off for the first order', source: 'Weee!', upvotes: 18, info: 'This is 6' },
          { keyword: '10% off for the first order', source: 'Best Buy', upvotes: 13, info: 'This is 7' }]

promos.each do |promo|
  Promotion.create!(promo)
end
