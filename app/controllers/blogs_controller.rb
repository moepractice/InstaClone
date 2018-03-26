class blogController < ApplicationController
  before_action :require_login
  before_action :set_blog, only:[:show, :edit, :update, :destroy]
  
  def index
    @blogs = blog.all
    @blog = blog.new
    @user = current_user
  end
  
  def new
    if params[:back]
      @blog = blog.new(blog_params)
    else
      @blog = blog.new
    end
  end
  
  def create
    @blog = blog.new(blog_params)
    @blog.user_id = current_user.id
   
    unless params[:cache] == nil
      @blog.image.retrieve_from_cache! params[:cache][:image]
    end
    
    if @blog.save
      ContactMailer.contact_mail(@blog).deliver
    else
      render 'new'
    end
  end
  
  def show
    @blog = blog.find(params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end
  
  def edit
    @blog = blog.find(params[:id])
  end
  
  def update
    @blog = blog.find(params[:id])
    unless params[:cache] == nil
      @blog.image.retrieve_from_cache! params[:cache][:image]
    end
    
    if 
      @blog.update(blog_params)
    else
      render 'edit'
    end
  end
  
  def confirm
    @blog = blog.new(blog_params)
    @blog.user_id = current_user.id
    render :new if @blog.invalid?
     @blog.user_id = current_user.id
      unless params[:cache] == nil
      @blog.image.retrieve_from_cache! params[:cache][:image] 
      end
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"Deleted"
  end
  
  def require_login
    unless logged_in?
    flash[:error] = "Please Login"
    redirect_to new_session_path
    end
  end
  
  private
  def blog_params
    params.require(:blog).permit(:content, :user_id, :image)
  end
  
  def set_blog
     @blog = blog.find(params[:user_id])
  end
  
end