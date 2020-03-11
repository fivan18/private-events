class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :location
      t.datetime :date
      t.index ['creator'], name: 'index_events_on_creator'
      t.timestamps
    end
  end
end
