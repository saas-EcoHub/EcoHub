require 'spec_helper'
require 'rails_helper'

describe CommentsController do
  before(:each) do
    @user = FactoryGirl.create(:tester).id
    promo = FactoryGirl.attributes_for(:BuyK)
    promo[:user_id] = @user
    @promo = Promotion.create!(promo).id
  end

  describe 'POST #create' do
    let!(:comment) { FactoryGirl.attributes_for(:Comment1) }
    it 'should fallback to root path' do
      post :create, session: { 'user_id': @user }, params: { 'promotion_id': @promo, 'comment': comment }
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'GET #new' do
    it 'should new a comment' do
      get :new, session: { 'user_id': @user }, params: { 'promotion_id': @promo, 'parent_id': 1 }
    end
  end

  describe 'PUT #upvote' do
    let!(:comment) { FactoryGirl.attributes_for(:Comment1) }

    it 'should render to root path with upvote' do
      post :create, session: { 'user_id': @user }, params: { 'promotion_id': @promo, 'comment': comment }
      put :upvote, session: { 'user_id': @user }, params: { 'comment_id': 1, 'promotion_id': @promo }
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'PUT #unvote' do
    let!(:comment) { FactoryGirl.attributes_for(:Comment1) }

    it 'should render to root path with unvote' do
      post :create, session: { 'user_id': @user }, params: { 'promotion_id': @promo, 'comment': comment }
      put :unvote, session: { 'user_id': @user }, params: { 'comment_id': 1, 'promotion_id': @promo }
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'PUT #downvote' do
    let!(:comment) { FactoryGirl.attributes_for(:Comment1) }

    it 'should render to root path with downvote' do
      post :create, session: { 'user_id': @user }, params: { 'promotion_id': @promo, 'comment': comment }
      put :downvote, session: { 'user_id': @user }, params: { 'comment_id': 1, 'promotion_id': @promo }
      expect(response).to redirect_to(root_path)
    end
  end

end
