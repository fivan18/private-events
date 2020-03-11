class User < ApplicationRecord
  attr_accessor :remember_token

  has_secure_password
  has_many :events, foreign_key: 'creator_id', class_name: 'Event',
                    dependent: :destroy
  has_many :attendences, foreign_key: 'attendee', class_name: 'Attendence'
  has_many :attended_events, through: :attendences
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?

    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
