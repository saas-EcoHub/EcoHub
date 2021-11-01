class PromotionsController < ApplicationController
    def index
        @promotion =Promotion.all
    end
    
    def new
        @promotion = Promotion.new
    end
    
    def create
        @promotion = Promotion.new(promotion_params)
        if @promotion.save
            redirect_to @promotion
        else
            render 'new'
        end
    end
    
    def show
        id = params[:id]
        @promotion = Promotion.find(id)
    end
    
    def destroy
        @promotion = Promotion.find(params[:id])
        @promotion.destroy
        flash[:notice] = "Promotion deleted"
        redirect_to promotions_path
    end
    
    def edit
        @promotion = Promotion.find(params[:id])
    end
        
    private
    def promotion_params
        params.require(:promotion).permit(:keyword, :source, :kind, :expdate, :info)
    end
end
