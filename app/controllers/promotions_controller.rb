class PromotionsController < ApplicationController
  def index
    @all_categories = Promotion.all_categories
    @categories_to_show = params[:categories] || session[:categories] || {}
    @categories_to_show = Hash[@all_categories.map { |o| [o, '1'] }] if @categories_to_show == {}
    sorting = params[:sort_by] || session[:sort_by] || ''
    @exp_header = 'exp'.eql?(sorting) ? 'hilite bg-warning' : ''

    if (params[:sort_by] != session[:sort_by]) || (params[:categories] != session[:categories])
      session[:sort_by] = sorting
      session[:categories] = @categories_to_show
      redirect_to promotions_path(categories: @categories_to_show, sort_by: sorting) and return
    end

    keys = @categories_to_show.keys
    keys.map { |a| Promotion.categories[a] }
    @promotion = if sorting == ''
                   Promotion.where(category: keys).order(cached_weighted_score: :desc)
                 else
                   Promotion.where(category: keys).order(expdate: :desc)
                 end
  end

  def new
    set_current_user
    redirect_to sign_in_path and return if Current.user.nil?

    @promotion = Promotion.new
  end

  def create
    promotion_params['category'] = Promotion.categories[promotion_params['category']]
    @promotion = Current.user.promotions.create!(promotion_params)
    redirect_to promotions_path
  end

  def show
    id = params[:id]
    @promotion = Promotion.find(id)
  end

  def destroy
    @promotion = Promotion.find(params[:id])
    @promotion.destroy
    redirect_to promotions_path
  end

  def edit
    @promotion = Promotion.find(params[:id])
  end

  def update
    @promotion = Promotion.find params[:id]
    promotion_params['category'] = Promotion.categories[promotion_params['category']]
    @promotion.update_attributes!(promotion_params)
    redirect_to promotion_path(@promotion)
  end

  def upvote
    set_current_user
    redirect_to sign_in_path and return if Current.user.nil?

    @promotion = Promotion.find(params[:id])
    @promotion.vote_by voter: Current.user, vote: 'like'
    redirect_back fallback_location: root_path
  end

  def downvote
    set_current_user
    redirect_to sign_in_path and return if Current.user.nil?

    @promotion = Promotion.find(params[:id])
    @promotion.vote_by voter: Current.user, vote: 'bad'
    redirect_back fallback_location: root_path
  end

  def unvote
    @promotion = Promotion.find(params[:id])
    Current.user.unvote_for @promotion
    redirect_back fallback_location: root_path
  end

  private

  def promotion_params
    params.require(:promotion).permit(:keyword, :source, :category, :expdate, :info)
  end
end
