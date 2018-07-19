class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :date
      t.integer :host_id
      t.integer :venue_id

      t.timestamps
    end
  end
end
