class CreateReservationFrames < ActiveRecord::Migration[6.1]
  def change
    create_table :reservation_frames do |t|
      t.references :planner,       foreign_key: true, null: false
      t.references :time_frame,    foreign_key: true, null: false
      t.datetime :reserved_at,     null: false
      t.string :status,            null: false

      t.timestamps
    end
    add_index :reservation_frames, [:planner_id, :time_frame_id], unique: true
  end
end
