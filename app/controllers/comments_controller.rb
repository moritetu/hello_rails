# coding: utf-8
class CommentsController < ApplicationController
  before_action :find_entry
  before_action :set_comment, except: [:create]

  def create
    @comment = Comment.new(comment_params)
    @comment.entry_id = @entry.id
    if @comment.save
      flash[:success] = 'コメントが作成されました'
    else
      flash[:danger] = 'コメントを作成できませんでした'
    end
    redirect_to_entry
  end

  def update
    if @comment.update(comment_params)
      flash[:success] = 'コメントは更新されました'
    else
      flash[:danger] = 'コメントは更新できませんでした'
    end
    redirect_to_entry
  end

  def destroy
    @comment.destroy
    flash[:success] = 'コメントは削除されました'
    redirect_to_entry
  end

  def approve
    if @comment.approve
      flash[:success] = 'コメントは承認されました'
    end
    redirect_to_entry
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_entry
    @entry = Entry.find(params[:entry_id])
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def redirect_to_entry
    redirect_to blog_entry_path(blog_id: @entry.blog_id, id: @entry.id)
  end
end
