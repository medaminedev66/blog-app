require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    Like.new(post_id: 7, Author_id: 7)
  end

  before do
    subject.save
  end

  it 'update the likes counter of post' do
    # subject.update_likes_counter
    expect(subject.post_id).to eq(7)
  end

  it 'checks that the post_id is integer' do
    # subject.update_likes_counter
    subject.post_id = 7.5
    expect(subject).to_not be_valid
  end
end
