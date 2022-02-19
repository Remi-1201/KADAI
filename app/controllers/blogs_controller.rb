class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  def index
    @blogs = Blog.all.order(created_at: :desc)
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
    @blog = current_user.blogs.build(blog_params)

    if params[:back]
      redirect_to blogs_path
    else
      if @blog.save
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
    @blog= Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  def destroy
    @blog.destroy
      redirect_to blogs_path, notice:"Blog was deleted！"
  end

  private
  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:user_id, :title, :name, :image_cache, :content, :image,:avatar_user, :avatar_user_cache)
  end
end