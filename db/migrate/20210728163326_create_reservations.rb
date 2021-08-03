class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.bigint :client_id,              null: false, comment: "Clientテーブルのid"
      t.bigint :reservation_frame_id,   null: false, comment: "ReservationFrameテーブルのid"

      t.timestamps
    end
    
  end
end
