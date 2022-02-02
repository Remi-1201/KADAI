class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  protect_from_forgery :except => [:destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if params[:back]
      redirect_to posts_path
    else
      if @post.save
        redirect_to posts_path, notice: "投稿を作成しました！"
      else
        render :new
      end
    end
  end

  def show    
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
      redirect_to posts_path, notice:"ブログを削除しました！"
  end

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
    end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end