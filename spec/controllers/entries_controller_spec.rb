# coding: utf-8
require "rails_helper"

describe EntriesController do
  describe 'GET #new' do
    context 'with blog' do
      it 'belongs to blog' do
        blog = create(:blog)
        get :new, blog_id: blog
        expect(assigns(:entry).blog).to eq blog
      end
    end

    context 'without blog' do
      it 'raises error' do
        expect { get :new }.to raise_error(/No route matches/)
      end
    end
  end

  describe 'POST #create' do
    context 'with blog' do
      it 'redirects to blog' do
        blog = create(:blog)
        post :create, blog_id: blog, entry: attributes_for(:entry, blog: blog, body: "test")
        expect(response).to redirect_to blog
      end
    end

    context 'with invalid blog' do
      it 'redirects to blog' do
        blog = create(:blog)
        post :create, blog_id: blog, entry: attributes_for(:entry, blog: blog)
        expect(response).to render_template :new
      end
    end
    
    context 'without blog' do
      it 'raises error' do
        expect {
          blog = build(:blog)
          post :create, blog_id: blog, entry: attributes_for(:entry, blog: blog)
        }.to raise_error(/No route matches/)
      end
    end
  end
end
