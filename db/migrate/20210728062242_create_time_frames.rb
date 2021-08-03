class CreateTimeFrames < ActiveRecord::Migration[6.1]
  def change
    create_table :time_frames do |t|
      t.datetime :start_at,    null: false, comment: '開始日時'
      t.datetime :end_at,      null: false, comment: '終了日時'

      t.timestamps
    end
  end
end
