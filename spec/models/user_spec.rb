require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations to test' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
  end
  describe 'associations to test' do
    it { should have_many(:events) }
    it { should have_many(:attended_events) }
  end
end
