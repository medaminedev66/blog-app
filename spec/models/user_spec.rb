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
end
