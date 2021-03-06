class Event < ApplicationRecord
  default_scope { order('date DESC') }
  scope :past, -> { where('date < ?', Time.now) }
  scope :upcom, -> { where('date > ?', Time.now) }
  belongs_to :creator, class_name: 'User'
  has_many :attendences, foreign_key: 'attended_event', class_name: 'Attendence'
  has_many :invitations, dependent: :destroy
  has_many :attendees, through: :Attendences
  has_many :attendees, through: :attendences
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true
end
