class CreateEventGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :event_guests do |t|
      t.integer :event_id
      t.integer :guest_id
      t.boolean :rsvp, default: false
    end
  end
end
