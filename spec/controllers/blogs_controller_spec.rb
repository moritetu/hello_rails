# coding: utf-8
require "rails_helper"

describe BlogsController do
  describe 'GET #index' do
    it "@blogsに全てのBlogが入っていること" do
      get :index
      create(:blog)
      expect(assigns(:blogs).size).to eq 1
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    it "新規作成後に@blogのshowに遷移すること" do
      get :new
      post :create, blog: attributes_for(:blog)
      expect(response).to redirect_to blog_path(assigns(:blog))
    end
  end
end
