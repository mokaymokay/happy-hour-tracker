class CreateHappyHourEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :happy_hour_events do |t|
      t.string :name
      t.string :location
      t.integer :capacity
    end
  end
end
