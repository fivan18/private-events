class CreateInvitation < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.integer :sender_id
      t.integer :event_id
      t.boolean :is_accepted, default: false
    end
  end
end
