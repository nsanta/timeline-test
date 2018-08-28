require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'associations' do
    it { should belong_to(:owner).class_name('User') }
  end

  describe 'validations' do
    it { should validate_presence_of(:message) }
    it { should validate_presence_of(:owner) }
  end
end
