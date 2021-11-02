class PromotionsController < ApplicationController
    def index
        @promotion =Promotion.all
    end
    
    def new
        @promotion = Promotion.new
    end
    
    def create
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
        @promotion.update_attributes!(promotion_params)
        redirect_to promotion_path(@promotion)
  end
        
    private
    def promotion_params
        params.require(:promotion).permit(:keyword, :source, :kind, :expdate, :info)
    end
end
