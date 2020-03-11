class Event < ApplicationRecord
    default_scope { order('date DESC') }
    belongs_to :creator, class_name: 'User'
    validates :title, presence: true
    validates :description, presence: true
    validates :date, presence: true
    validates :location, presence: true
end
