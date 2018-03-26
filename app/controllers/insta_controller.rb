class InstaController < ApplicationController
  before_action :require_login
  before_action :set_insta, only:[:show, :edit, :update, :destroy]
  
  def index
    @instas = insta.all
    @insta = insta.new
    @user = current_user
  end
  
  def new
    if params[:back]
      @insta = insta.new(insta_params)
    else
      @insta = insta.new
    end
  end
  
  def create
    @insta = insta.new(insta_params)
    @insta.user_id = current_user.id
   
    unless params[:cache] == nil
      @insta.image.retrieve_from_cache! params[:cache][:image]
    end
    
    if @insta.save
      ContactMailer.contact_mail(@insta).deliver
    else
      render 'new'
    end
  end
  
  def show
    @insta = insta.find(params[:id])
    @favorite = current_user.favorites.find_by(insta_id: @insta.id)
  end
  
  def edit
    @insta = insta.find(params[:id])
  end
  
  def update
    @insta = insta.find(params[:id])
    unless params[:cache] == nil
      @insta.image.retrieve_from_cache! params[:cache][:image]
    end
    
    if 
      @insta.update(insta_params)
    else
      render 'edit'
    end
  end
  
  def confirm
    @insta = insta.new(insta_params)
    @insta.user_id = current_user.id
    render :new if @insta.invalid?
     @insta.user_id = current_user.id
      unless params[:cache] == nil
      @insta.image.retrieve_from_cache! params[:cache][:image] 
      end
  end
  
  def destroy
    @insta.destroy
    redirect_to instas_path, notice:"Deleted"
  end
  
  def require_login
    unless logged_in?
    flash[:error] = "Please Login"
    redirect_to new_session_path
    end
  end
  
  private
  def insta_params
    params.require(:insta).permit(:content, :user_id, :image)
  end
  
  def set_insta
     @insta = insta.find(params[:user_id])
  end
  
end