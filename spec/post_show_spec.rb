require 'rails_helper'

RSpec.describe "posts/show.html.erb", type: :feature do
  before(:each) do
    visit new_user_session_path
    @user = User.new(Name: "Amine", Bio: "Full stack developer", email: "md.amine.smahi@gmail.com", password: "admin@2020", Photo: "photo_url", PostsCounter: 1, confirmed_at: Time.now)
    @user.save
    fill_in 'user[email]', with: "md.amine.smahi@gmail.com"
    fill_in 'user[password]', with: "admin@2020"
    click_button 'Log in'
    @post = Post.create(Title: 'First post', Text: 'How is it going?', author_id: @user.id, CommentsCounter: 0, LikesCounter: 0)
    @comment = Comment.create(Text: "first comment", Author_id: @user.id, post_id: Post.first.id)
    find_link("user_#{@user.id}").click
    find_link('See All The Posts').click
    find_link("post_#{@post.id}").click
  end

    it "shows the post's body" do
      expect(page).to have_content 'How is it going?'
    end

    it 'shows who wrote the post' do
      expect(page).to have_content("By: #{@user.Name}")
    end

    scenario 'shows how many comments it has' do
      expect(page).to have_content "comments: 1"
    end

    scenario 'shows how many likes it has' do
      expect(page).to have_content "Likes: #{@post.LikesCounter}"
    end

    scenario "shows a post's title" do
      expect(page).to have_content("Post: ##{@post.id}")
    end

    it 'shows the username of each commentor' do
      expect(page).to have_content(User.find_by(id: @comment.Author_id).Name)
    end

    it 'shows the comment of each commentor' do
      expect(page).to have_content(@comment.Text)
    end
end