FactoryGirl.define do
  factory :tester, class: 'User' do
    nickname 'Test'
    email '123@gmail.com'
    password 'password'
  end

  factory :tester2, class: 'User' do
    nickname 'Test'
    email '456@gmail.com'
    password '123456'
  end

  factory :invalid, class: 'User' do
    nickname 'HAHA'
    email 'not valid'
    password 'pswd'
    extra 'extra'
  end
end
