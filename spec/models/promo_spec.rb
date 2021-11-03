require 'spec_helper'
require 'rails_helper'

describe Promotion do

  before(:each) do
    @attr = {
      keyword: '$45 off for order over $45',
      source: 'BuyK',
      expdate: '2022-12-31',
      info: 'Test Data',
      upvotes: 50,
      category: 'Refer Code'
    }
  end

  it 'should create a new instance given a valid attribute' do
    Promotion.create!(@attr)
  end
  describe 'all_categories' do
    it 'return all categories' do
      expect(Promotion.all_categories).to match(['New User Only', 'Refer Code', 'Common', 'Other'])
    end
  end
  describe '' do

  end
end
