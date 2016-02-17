# coding: utf-8
require "rails_helper"

describe do
  it "titleがあれば有効な状態であること" do
    blog = Blog.new(title: "hoge")
    expect(blog).to be_valid
  end
  
  it "titleがなければ無効な状態であること" do
    blog = Blog.new(title: nil)
    expect(blog).not_to be_valid
  end
end
