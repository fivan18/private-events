require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations to test' do
    it { should have_many(:events) }
    it { should have_many(:attended_events) }
  end
end
