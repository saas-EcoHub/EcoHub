class PromotionsController < ApplicationController
  def index
    @all_categories = Promotion.all_categories
    all_categories_map = Hash[@all_categories.map { |o| [o, '1'] }]
    session[:categories] = all_categories_map unless session.key?(:categories)
    session[:sort_by] = '' unless session.key?(:sort_by)
    session[:categories] = if params.key?(:categories)
                             params[:categories]
                           else
                             'Refresh'.eql?(params[:commit]) ? all_categories_map : session[:categories]
                           end
    session[:sort_by] = params.key?(:sort_by) ? params[:sort_by] : session[:sort_by]
    unless params.key?(:categories) && params.key?(:sort_by)
      redirect_to promotions_path(categories: session[:categories], sort_by: session[:sort_by]) and return
    end

    @categories_to_show = params[:categories].keys
    @promotion = Promotion.with_category(@categories_to_show)
    @promotion = if ''.eql?(params[:sort_by])
                   @promotion.order(upvotes: :desc)
                 else
                   @promotion.order(expdate: :desc)
                 end
    @exp_header = 'exp'.eql?(params[:sort_by]) ? 'hilite bg-warning' : ''
  end

  def new
    @promotion = Promotion.new
  end

  def create
    promotion_params['category'] = Promotion.categories[promotion_params['category']]
    @promotion = Promotion.create!(promotion_params)
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

  private

  def promotion_params
    params.require(:promotion).permit(:keyword, :source, :category, :expdate, :info)
  end
end
