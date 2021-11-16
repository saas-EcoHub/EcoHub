FactoryGirl.define do
  factory :BuyK, class: 'Promotion' do
    keyword '$45 off for order over $45'
    source 'BuyK'
    expdate '2022-12-31'
    info 'Test Data'
    user_id 1
    category 'Refer Code'
  end
  factory :Wee, class: 'Promotion' do
    keyword '$20 off for the first order'
    source 'Weee!'
    expdate '2022-01-01'
    info 'Test Data'
    user_id 1
    category 'New User Only'
  end
  factory :Gorillas, class: 'Promotion' do
    keyword '$21 off for order over $21'
    source 'Gorillas'
    expdate '2021-12-31'
    info 'Test Data'
    user_id 1
    category 'Other'
  end
end
