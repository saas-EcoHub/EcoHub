require 'spec_helper'
require 'rails_helper'

describe Promotion do

  before(:each) do
    @attr = {
      keyword: '$45 off for order over $45',
      source: 'BuyK',
      expdate: '2022-12-31',
      info: 'Test Data',
      user_id: 1,
      category: 'Refer Code'
    }
    @user = {
      nickname: 'Test',
      email: '123@gmail.com',
      password_digest: 'password'
    }
  end

  it 'should fail due to foreign key' do
    expect(Promotion.create(@attr)).not_to be_valid
  end

  it 'should create a new instance given a valid attribute' do
    User.create!(@user)
    Promotion.create!(@attr)
  end
  describe 'all_categories' do
    it 'return all categories' do
      expect(Promotion.all_categories).to match(['New User Only', 'Refer Code', 'Common', 'Other'])
    end
  end
end
