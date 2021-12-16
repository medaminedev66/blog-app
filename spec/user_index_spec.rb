require 'rails_helper'

RSpec.describe "users/index.html.erb", type: :feature do
  before(:each) do
    visit new_user_session_path
    @user1 = User.new(Name: "Amine", Bio: "Full stack developer", email: "md.amine.smahi@gmail.com", password: "admin@2020", Photo: "photo_url", PostsCounter: 1, confirmed_at: Time.now)
    @user2 = User.new(Name: "Dammy", Bio: "Full stack developer", email: "dammy@ymail.com", password: "admin@2040", Photo: "photo_url", PostsCounter: 1, confirmed_at: Time.now)
    @user1.save
    @user2.save
    fill_in 'user[email]', with: "md.amine.smahi@gmail.com"
    fill_in 'user[password]', with: "admin@2020"
    click_button 'Log in'
  end

  it "checks name of all users" do
    expect(page).to have_content @user1.Name
    expect(page).to have_content @user2.Name
  end

  it "checks photo of all users" do
    all('img').each do |i|
        expect(i[:src]).to eq(@user1.Photo)
    end
  end

  
  it "checks The posts' number of all users" do
    expect(page).to have_content('Number of posts: 1')
  end

  it "checks content of clicked page" do
    @user3 = User.create(Name: "Karim", Bio: "Full stack developer", email: "kar@ymail.com", password: "admin@2040", Photo: "photo_url", PostsCounter: 0, confirmed_at: Time.now)
    visit users_path
    find_link("user_#{@user3.id}").click
    expect(current_path).to eq user_path(@user3.id)
  end
end
