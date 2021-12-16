require 'rails_helper'

RSpec.describe "posts/index.html.erb", type: :feature do
  before(:each) do
    visit new_user_session_path
    @user = User.new(Name: "Amine", Bio: "Full stack developer", email: "md.amine.smahi@gmail.com", password: "admin@2020", Photo: "photo_url", PostsCounter: 1, confirmed_at: Time.now)
    @user.save
    5.times do
      Post.create(Title: "First post", Text: "Post content", author_id: @user.id, CommentsCounter: 0, LikesCounter: 0)
    end
    fill_in 'user[email]', with: "md.amine.smahi@gmail.com"
    fill_in 'user[password]', with: "admin@2020"
    visit(user_posts_path(@user.id))
  end

    it "Shows user's name" do
      expect(page).to have_content @user.Name
    end

    it "shows user's profile picture" do
      all('img').each do |i|
        expect(i[:src]).to eq(@user.Photo)
      end
    end
    
    it 'shows number of posts of user has written' do
      expect(page).to have_content "Number of posts: 6"
    end

    it "shows see a post's title" do  
      expect(page).to have_content "Post #{Post.first.id}"
    end

    it "shows some of the post's body" do
      expect(page).to have_content Post.first.Text
    end

    it 'shows the first comment on a post' do
      Comment.create(Text: "first comment", Author_id: @user.id, post_id: Post.first.id)
      visit(user_posts_path(@user.id))
      expect(page).to have_content Comment.first.Text
    end

    it 'shows how many comments a post has' do
      expect(page).to have_content "comments: 0"
    end

    it 'I should see how many likes a post has' do
      expect(page).to have_content "Likes: 0"
    end

    it "redirects the user to the post's show page after clickin on it" do
      find_link("post_#{Post.first.id}").click
      expect(current_path).to eq user_post_path(@user.id, Post.first.id)
    end
end