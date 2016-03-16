# coding: utf-8
require "rails_helper"

feature 'Blog管理'do
  scenario 'Blogの新規作成時にtitleを入力しなかった場合にエラーが表示されること' do
    visit new_blog_path
    click_button 'Submit'
    expect(page).to have_content "Title can't be blank"
  end

  scenario 'Blogの新規作成時にtitleを入力した場合はデータが保存され閲覧画面に遷移すること' do
    visit new_blog_path
    fill_in 'Title', with: 'title'
    expect {
      click_button 'Submit'
    }.to change(Blog, :count).by(1)
    expect(current_path).to eq blog_path(Blog.last)
    expect(page).to have_content 'ブログを作成しました'
  end
end
