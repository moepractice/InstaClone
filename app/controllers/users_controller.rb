class UsersController < ApplicationController
    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      
      if @user.save
          redirect_to user_path(@user.id)
      else
          render 'new'
      end
    end
    
    def show
      @user = User.find(params[:id])
       @favorites = @user.favorite_blogs
     # @favorites = current_user.favorites
      # @favorite = current_user.favorites.find_by(blog_id: @blog.id) if current_user.favorites
    end
    
    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
