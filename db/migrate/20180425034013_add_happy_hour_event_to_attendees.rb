class AddHappyHourEventToAttendees < ActiveRecord::Migration[5.2]
  def change
    add_column :attendees, :happy_hour_event_id, :integer
  end
end
