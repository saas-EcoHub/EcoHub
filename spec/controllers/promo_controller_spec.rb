require 'spec_helper'
require 'rails_helper'

describe PromotionsController do

  before(:each) do
    @user = FactoryGirl.create(:tester).id
    @promo = FactoryGirl.attributes_for(:BuyK)
    @promo[:user_id] = @user
  end

  describe 'GET index' do
    # all_categories_map = Hash[Promotion.all_categories.map { |o| [o, '1'] }]
    it 'should reset the current user' do
      get :index, session: { user_id: '12345' }
      expect(response).to render_template('index')
    end

    it 'should render the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'should have no exp header when initialized' do
      get :index
      expect(assigns(:exp_header)).to eql('')
    end

    it 'should assign instance variable for exp header if has sort_by attribute 1' do
      get :index, params: { sort_by: 'exp' }
      expect(assigns(:exp_header)).to eql('hilite bg-warning')
    end

    it 'should assign instance variable for exp header if has sort_by attribute 2' do
      get :index, params: { sort_by: 'exp' }, session: { sort_by: 'exp' }
      expect(assigns(:exp_header)).to eql('hilite bg-warning')
    end
  end

  describe 'Redirect to sign-in when GET new if no info' do
    Current.user = nil
    it 'should redirect to sign-in' do
      get :new
      expect(response).to redirect_to(sign_in_path)
    end
  end

  describe 'GET new' do
    it 'should render the new template' do
      get :new, session: { 'user_id': @user }
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    it 'should create a new promo' do
      expect do
        post :create, params: { promotion: @promo }, session: { 'user_id': @user }
      end.to change { Promotion.count }.by(1)
    end

    it 'should redirect to the movie index page' do
      post :create, params: { promotion: @promo }, session: { 'user_id': @user }
      expect(response).to redirect_to(promotions_url)
    end
  end

  describe 'GET #show' do
    let!(:promotion) { Promotion.create(@promo) }
    before(:each) do
      get :show, params: { id: promotion.id }
    end

    it 'should find the promo' do
      expect(assigns(:promotion)).to eql(promotion)
    end

    it 'should render the show template' do
      expect(response).to render_template('show')
    end
  end

  describe 'GET #edit' do
    let!(:promotion) { Promotion.create(@promo) }
    before(:each) do
      get :edit, params: { id: promotion.id }
    end

    it 'should find the promo' do
      expect(assigns(:promotion)).to eql(promotion)
    end

    it 'should render the edit template' do
      expect(response).to render_template('edit')
    end
  end

  describe 'PUT #update' do
    let!(:promotion) { Promotion.create(@promo) }
    before(:each) do
      update = FactoryGirl.attributes_for(:BuyK, info: 'Modified')
      update[:user_id] = @user
      put :update, params: { id: promotion.id, promotion: update }
    end

    it 'should update an existing promo' do
      promotion.reload
      expect(promotion.info).to eql('Modified')
    end

    it 'should redirect to the detail page' do
      expect(response).to redirect_to(promotion_path(promotion))
    end
  end

  describe 'DELETE #destroy' do
    let!(:promotion) { Promotion.create(@promo) }

    it 'should destroy a promo' do
      expect do
        delete :destroy, params: { id: promotion.id }
      end.to change { Promotion.count }.by(-1)
    end

    it 'should direct to index' do
      delete :destroy, params: { id: promotion.id }
      expect(response).to redirect_to(promotions_path)
    end
  end

  describe 'Redirect to sign-in when upvoting if no info' do
    Current.user = nil
    let!(:promotion) { Promotion.create(@promo) }
    before(:each) do
      put :upvote, params: { id: promotion.id }
    end

    it 'should redirect to sign-in' do
      expect(response).to redirect_to(sign_in_path)
    end
  end

  describe 'PUT #upvote' do
    let!(:promotion) { Promotion.create(@promo) }
    before(:each) do
      put :upvote, params: { id: promotion.id }, session: { 'user_id': @user }
    end

    it 'should find vote items' do
      expect(promotion.get_positives.size).to eq(1)
    end

    it 'should redirect back' do
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'Redirect to sign-in when downvoting if no info' do
    Current.user = nil
    let!(:promotion) { Promotion.create(@promo) }
    before(:each) do
      put :downvote, params: { id: promotion.id }
    end

    it 'should redirect to sign-in' do
      promotion.reload
      expect(response).to redirect_to(sign_in_path)
    end
  end

  describe 'PUT #downvote' do
    let!(:promotion) { Promotion.create(@promo) }
    before(:each) do
      put :downvote, params: { id: promotion.id }, session: { 'user_id': @user }
    end

    it 'should find vote items' do
      expect(promotion.get_negatives.size).to eq(1)
    end

    it 'should redirect back' do
      promotion.reload
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'PUT #unvote' do
    let!(:promotion) { Promotion.create(@promo) }
    before(:each) do
      put :downvote, params: { id: promotion.id }, session: { 'user_id': @user }
      put :unvote, params: { id: promotion.id }, session: { 'user_id': @user }
    end

    it 'should find vote items' do
      expect(promotion.votes_for.size).to eq(0)
    end

    it 'should redirect back' do
      promotion.reload
      expect(response).to redirect_to(root_path)
    end
  end

end
