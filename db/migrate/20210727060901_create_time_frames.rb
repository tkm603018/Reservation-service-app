class CreateTimeFrames < ActiveRecord::Migration[6.1]
  def change
    create_table :time_frames do |t|
      t.datetime :start_at,    null: false
      t.datetime :end_at,      null: false

      t.timestamps
    end
  end
end
