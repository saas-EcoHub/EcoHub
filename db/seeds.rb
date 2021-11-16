# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [{ nickname: 'Tester', email: '123456@gmail.com', password_digest: '123456' }]

users.each do |user|
  User.create!(user)
end

promos = [{ keyword: '$35 off for order over $45', source: 'BuyK', info: 'This is 1', user_id: 1 },
          { keyword: '$20 off for order over $21', source: 'Gorillas', category: 1, info: 'This is 2', user_id: 1 },
          { keyword: '10% off for the first order', source: 'Ebay', info: 'This is 3', user_id: 1 },
          { keyword: '$30 off for order over $50', source: 'Instcart', info: 'This is 4', user_id: 1 },
          { keyword: '$100 for free', source: 'Peach', category: 3, info: 'This is 5', expdate: '2021-11-03', user_id: 1 },
          { keyword: '$20 off for the first order', source: 'Weee!', info: 'This is 6', user_id: 1 },
          { keyword: '10% off for the first order', source: 'Best Buy', info: 'This is 7', user_id: 1 }]

promos.each do |promo|
  Promotion.create!(promo)
end
