# coding: utf-8
class EntriesController < ApplicationController
  before_action :find_blog
  before_action :set_entry, only: [:show, :edit, :destroy, :update]

  def new
    @entry = Entry.new(blog_id: @blog.id)
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.blog_id = @blog.id
    if @entry.save
      flash[:success] = 'エントリーが作成されました'
      redirect_to @blog
    else
      render 'new'
    end
  end
  
  def edit
  end

  def show
  end

  def update
    if @entry.update(entry_params)
      flash[:success] = 'エントリーは更新されました'
      redirect_to @blog
    else
      render 'edit'
    end
  end
  
  def destroy
    @entry.destroy
    flash[:success] = 'エントリーは削除されました'
    redirect_to @blog
  end
  
  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:title, :body)
  end

  def find_blog
    @blog = Blog.find(params[:blog_id])
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end
end
