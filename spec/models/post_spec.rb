require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(Title: 'Learn how to write a model test', Text: 'Why model tests important', author_id: 1) }

  before { subject.save }

  it 'Title must not be blank.' do
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters.' do
    subject.Text = 'test' * 100
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be an integer greater than or equal to zero.' do
    subject.CommentsCounter = -5.7
    expect(subject).to_not be_valid
  end

  it 'LikesCounter must be an integer greater than or equal to zero.' do
    subject.LikesCounter = -5.6
    expect(subject).to_not be_valid
  end
end
