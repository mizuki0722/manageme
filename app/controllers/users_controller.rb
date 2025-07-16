class UsersController < ApplicationController
        def show
          @user = User.find(params[:id]) 
          @diet = @user.diets.order(created_at: :desc).first
        end
      end
