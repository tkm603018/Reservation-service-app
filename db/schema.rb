# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_28_163326) do

  create_table "reservation_frames", charset: "utf8", force: :cascade do |t|
    t.bigint "planner_id", null: false, comment: "Plannerテーブルのid"
    t.datetime "reserved_at", null: false, comment: "予約日時"
    t.integer "status", default: 0, null: false, comment: "表示"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reservations", charset: "utf8", force: :cascade do |t|
    t.bigint "client_id", null: false, comment: "Clientテーブルのid"
    t.bigint "reservation_frame_id", null: false, comment: "ReservationFrameテーブルのid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", null: false, comment: "メールアドレス"
    t.string "password_digest", null: false, comment: "パスワード"
    t.string "name", default: "氏名未登録", comment: "氏名"
    t.string "type", null: false, comment: "ユーザータイプ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
