class CreateReservationFrames < ActiveRecord::Migration[6.1]
  def change
    create_table :reservation_frames do |t|
      t.bigint :planner_id,       null: false, comment: "Plannerテーブルのid"
      t.bigint :time_frame_id,    null: false, comment: "TimeFrameテーブルのid"
      t.datetime :reserved_at,    null: false, comment: "予約日時"
      t.string :status,           null: false, comment: "空き状況"

      t.timestamps
    end
    
  end
end
