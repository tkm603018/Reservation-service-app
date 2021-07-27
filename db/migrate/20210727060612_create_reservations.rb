class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :client,               foreign_key: true, null: false
      t.references :reservation_frame,    foreign_key: true, null: false

      t.timestamps
    end
    add_index :reservations, [:client_id, :reservation_frame_id], unique: true
  end
end
