require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    Comment.new(post_id: 8, Author_id: 3)
  end

  before do
    subject.save
  end

  it 'is created correctly' do
    expect(subject.post_id).to eq(8)
  end

  it 'checks that the post_id is integer' do
    subject.post_id = 10.5
    expect(subject).to_not be_valid
  end
end
