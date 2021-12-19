require 'spec_helper'
require 'rails_helper'

describe SessionsController do
  describe 'GET #new' do
    it 'should do nothing' do
      get :new
    end
  end

  describe 'POST #create' do
    let!(:valid) do
      FactoryGirl.create(:tester2)
      FactoryGirl.attributes_for(:tester2)
    end

    it 'should redirect to promo path' do
      post :create, params: { 'user': valid }
      expect(response).to redirect_to(promotions_path)
    end

    let!(:invalid) { FactoryGirl.attributes_for(:invalid) }
    it 'should render to new' do
      post :create, params: { 'user': invalid }
    end
  end

  describe 'DELETE #destroy' do
    it 'should redirect to promo path' do
      delete :destroy
      expect(response).to redirect_to(promotions_path)
    end
  end

end
