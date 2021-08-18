class CreateReservationFrames < ActiveRecord::Migration[6.1]
  def change
    create_table :reservation_frames do |t|
      t.bigint :planner_id,       null: false, comment: "Plannerテーブルのid"
      t.datetime :reserved_at,    null: false, comment: "予約日時"
      t.string :status,           null: false, comment: "表示"

      t.timestamps
    end
    
  end
end
