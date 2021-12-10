require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(Name: 'Amine', Bio: "I'm Amine", Photo: 'User photo') }

  before { subject.save }

  it 'Name must not be blank' do
    subject.Name = ''
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero.' do
    subject.PostsCounter = -5
    expect(subject).to_not be_valid
  end

  it 'test the recent method' do
    5.times do |_post|
      Post.create(Title: 'Post', Text: 'Create a post', author_id: subject, LikesCounter: 0, CommentsCounter: 0)
    end
    expect(subject.recent_posts).to eq(subject.posts.last(3))
  end
end
