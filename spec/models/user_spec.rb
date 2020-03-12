require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations to test' do
    it do
      should validate_presence_of(:username)
    end
    it do
      should validate_presence_of(:email)
    end
  end
  describe 'associations to test' do
    it do
      should have_many(:events)
    end
    it do
      should have_many(:attended_events)
    end
  end
end
