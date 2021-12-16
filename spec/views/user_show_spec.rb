require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :feature do
  before(:each) do
    visit new_user_session_path
    @user = User.new(Name: 'Amine', Bio: 'Full stack developer', email: 'md.amine.smahi@gmail.com',
                     password: 'admin@2020', Photo: 'photo_url', PostsCounter: 1, confirmed_at: Time.now)
    @user.save
    fill_in 'user[email]', with: 'md.amine.smahi@gmail.com'
    fill_in 'user[password]', with: 'admin@2020'
    visit user_path(@user)
  end

  it "shows user's profile picture" do
    all('img').each do |i|
      expect(i[:src]).to eq(@user.Photo)
    end
  end

  it "shows user's name" do
    expect(page).to have_content @user.Name
  end

  it 'shows the number of posts user has written' do
    expect(page).to have_content "Number of posts: #{@user.PostsCounter}"
  end

  it "shows user's bio" do
    expect(page).to have_content @user.Bio
  end

  it 'shows the first 3 posts of user' do
    Post.create(Title: 'First post', Text: 'Post content', author_id: @user.id, CommentsCounter: 0, LikesCounter: 0)
    Post.create(Title: 'Second post', Text: 'Post content', author_id: @user.id, CommentsCounter: 0, LikesCounter: 0)
    Post.create(Title: 'Third post', Text: 'Post content', author_id: @user.id, CommentsCounter: 0, LikesCounter: 0)
    visit user_path(@user)
    expect(all('.post').length).to eq(3)
  end

  it "shows a button that lets the user view all of a user's posts" do
    expect(find_link('See All The Posts').visible?).to be true
  end
end
