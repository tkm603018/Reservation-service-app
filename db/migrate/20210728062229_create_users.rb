class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email,     null: false,                      comment: "メールアドレス"
      t.string :password_digest,  null: false,               comment: "パスワード"
      t.string :name,                   default: "氏名未登録", comment: "氏名"
      t.string :type,      null: false,                      comment: "ユーザータイプ"

      t.timestamps
    end
  end
end
