class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy]
  before_action :authenticate_user
  before_action :correct_user, only: [:edit, :update, :destroy]

  def authenticate_user
    @current_user = User.find_by(id: session[:user_id])
    if @current_user.nil?
      redirect_to new_session_path
    end
  end

  def correct_user
    @user = @blog.user
    redirect_to(blogs_path) unless @user == current_user    
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def index
    @blogs = Blog.all.order(created_at: :desc)
    @favorites = Favorite.all
  end

  def show
  end

  def new
    if params[:back]
      @blog= Blog.new(blog_params)
    else
      @blog= Blog.new
    end
  end

  def edit
  end


  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if params[:back]
      redirect_to blogs_path
    else
      if @blog.save
        ContactMailer.contact_mail(@blog).deliver
        redirect_to blogs_path, notice: "Blog was successfully created."
      else
        render :new
      end
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "Blog was successfully updated."
    else
      render :edit
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    render :new if @blog.invalid?
  end

  def destroy
    @blog.destroy
      redirect_to blogs_path, notice:"Blog was deleted！"
  end

  private
  def blog_params
    params.require(:blog).permit(:user_id, :title, :name, :image_cache, :content, :image, :content_cache, :title_cache)
  end
end