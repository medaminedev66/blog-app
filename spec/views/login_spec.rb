require 'rails_helper'

RSpec.describe "devise/sessions/new.html.erb", type: :feature do
  before(:each) do
    visit new_user_session_path
  end
  
  it "displays the Submit button" do
    expect(page).to have_button('Log in')
  end

  it "displays email input" do
    expect(page).to have_field('user[email]')
  end

  it "displays password input" do
    expect(page).to have_field('user[password]')
  end

  it 'without email and password' do
    click_button 'Log in'
    expect(page).to have_current_path(new_user_session_path)
  end

  it 'with invalid email and password' do
    fill_in 'user[email]', with: 'email@email.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
    expect(page).to have_current_path(new_user_session_path)
  end

  it "Signs in when we enter the correct email and password" do
    User.create(Name: "Amine", Bio: "Full stack developer", email: "md.amine.smahi@gmail.com", password: "admin@2020", PostsCounter: 0, confirmed_at: Time.now)
    fill_in 'user[email]', with: "md.amine.smahi@gmail.com"
    fill_in 'user[password]', with: "admin@2020"
    click_button 'Log in'
    expect(page).to have_current_path('/')
  end
end
