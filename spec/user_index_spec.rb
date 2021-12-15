require 'rails_helper'

RSpec.describe "users/index.html.erb", type: :feature do
  before(:each) do
    visit users_path
    @user1 = User.new(Name: "Amine", Bio: "Full stack developer", email: "md.amine.smahi@gmail.com", password: "admin@2020", Photo: "photo_url", PostsCounter: 3, confirmed_at: Time.now)
    @user2 = User.new(Name: "Dammy", Bio: "Full stack developer", email: "dammy@ymail.com", password: "admin@2040", Photo: "no_img.png", PostsCounter: 0, confirmed_at: Time.now)
  end

  it "checks name of all users" do
    @user1.save
    @user2.save
    expect(page).to have_content @user1.name
    expect(page).to have_content @user2.name
  end

  it "checks photo of all users" do
    @user1.save
    @user2.save
    expect(page).to have_content @user1.photo
    expect(page).to have_content @user2.photo
  end

  it "checks posts of all users" do
    @user1.save
    expect(page).to have_content('Number of posts: 3')
  end

  it "checks content of clicked page" do
    @user2 = User.create(Name: 'Amine', Bio: "Microverse Student" email: 'medamine@gmail.com', password: 'admin', PostsCounter: 0, confirmed_at: Time.now)

    @post = Post.create(Title: 'Learn how to write a views test', Text: 'Why views tests important', author_id: @user2.id)

      fill_in 'Email', with: @user2.email
      fill_in 'Password', with: @user2.password
      click_button 'Log in'
      find("a[href='#{user_path(@user2.id)}']").click
      expect(page).to have_content 'Why views tests important'
  end
end
