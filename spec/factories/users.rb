FactoryGirl.define do
  factory :tester, class: 'User' do
    nickname 'Test'
    email '123@gmail.com'
    password_digest 'password'
  end
end
