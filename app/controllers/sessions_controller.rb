class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:user][:email])
        if user.present? && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to promotions_path, notice: "Logged in successfully"
        else
            flash[:alert] = "Invalid email or password"
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to promotions_path, notice: "Logged out"
    end
end