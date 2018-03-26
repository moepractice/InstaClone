class BlogsController < ApplicationController
  before_action :require_login
  before_action :set_blog, only:[:show, :edit, :update, :destroy]
  
  def index
    @blogs = Blog.all
    @blog = Blog.new
    @user = current_user
  end
  
  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end
  
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
   
    unless params[:cache] == nil
      @blog.image.retrieve_from_cache! params[:cache][:image]
    end
    
    if @blog.save
      ContactMailer.contact_mail(@blog).deliver
      redirect_to blogs_path
    else
      render 'new'
    end
  end
  
  def show
    @blog = Blog.find(params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    
    unless params[:cache] == nil
      @blog.image.retrieve_from_cache! params[:cache][:image]
    end
    
    if 
      @blog.update(blog_params)
      redirect_to blogs_path
    else
      render 'edit'
    end
  end
  
  def confirm
    @blog = Blog.new(blog_params)
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
     @blog = Blog.find(params[:id])
  end
  
end