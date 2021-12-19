require 'spec_helper'
require 'rails_helper'

describe Promotion do
  describe 'fk constraint' do
    let!(:promoWithoutFK) { FactoryGirl.attributes_for(:BuyK) }

    it 'should fail due to foreign key' do
      expect(Promotion.create(promoWithoutFK)).not_to be_valid
    end
  end

  describe 'all_categories' do
    it 'return all categories' do
      expect(Promotion.all_categories).to match(['New User Only', 'Refer Code', 'Common', 'Other'])
    end
  end
end
