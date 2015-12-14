# coding: utf-8
class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:success] = 'ブログを作成しました'
      redirect_to @blog
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      flash[:success] = 'ブログは更新されました'
      redirect_to @blog
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    flash[:success] = 'ブログは削除されました'
    redirect_to blogs_url
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title)
  end
end
