require 'spec_helper'
require 'rails_helper'

describe RegistrationsController do
  describe 'GET #new' do
    it 'should do nothing' do
      get :new
    end
  end

  describe 'POST #create' do
    let!(:valid) { FactoryGirl.attributes_for(:tester) }
    let!(:invalid) { FactoryGirl.attributes_for(:invalid) }

    it 'should redirect to promo path' do
      post :create, params: { 'user': valid }
      expect(response).to redirect_to(promotions_path)
    end

    it 'should render to new' do
      post :create, params: { 'user': invalid }
    end

  end
end
