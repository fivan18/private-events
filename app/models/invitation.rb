class Invitation < ApplicationRecord
  belongs_to :receiver, class_name: 'User', foreign_key: :sender_id
  belongs_to :event
  belongs_to :invitee, foreign_key: :user_id, class_name: 'User'
end
