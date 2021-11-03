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
                   Promotion.where(category: keys).order(upvotes: :desc)
                 else
                   Promotion.where(category: keys).order(expdate: :desc)
                 end
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
