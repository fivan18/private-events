class CreateAttendence < ActiveRecord::Migration[5.2]
  def change
    create_table :attendences do |t|
      t.integer :attended_event_id
      t.integer :attendee_id
    end
  end
end
