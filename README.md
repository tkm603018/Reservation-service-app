<!-- # README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# sample-app1 -->

<h1 align="center">
  予約サービスアプリ
</h1>

## 📖 アプリの概要
  クライアントがファイナンシャルプランナー（以下プランナー）に相談できる予約サービス
  - ## **ユーザーについて**
    2種類のユーザーが存在する(STI: 単一テーブル継承)

    **クライアント**: 予約枠を予約する側

    **プランナー**: 予約枠を作成する側

  - ## **予約枠について**
    ```
    一枠 30分, 00 or 30分開始
    平　日: 10:00 ~ 18:00
    土曜日: 11:00 ~ 15:00
    日曜日: 休業日
    ```
  - ## **予約までの流れについて**
    1. プランナーが予約を受け付ける枠を作成
    2. クライアントが, プランナーの空いている枠を予約する
  - ## **各ユーザーができるアクション**
    - **クライアント** 側
    
      - 予約枠を予約, キャンセル
    - **プランナー** 側
    
      - 予約枠を作成, 削除

      - クライアント側で予約枠の公開切り替え
    - 共通
      
      - 氏名の変更

      - ログイン, ログアウト

      - ユーザー登録

---
## 🚀 クイックスタート

- ## ローカルでの設定

  1.  **リポジトリをクローン**

      ```shell
      g clone https://github.com/tkm603018/sample-app1.git
      ```

  2.  **ライブラリをインストール**

      ```shell
      cd sample-app1/
      bundle install
      ```
  3.  **DBを接続**

      mysqlで新規DBを作成 & .envに
      ```shell
      DATABASE_DEV_NAME
      DATABASE_DEV_PASSWORD
      DATABASE_DEV_USER
      DATABASE_DEV_HOST
      ```
      を記述し, 以下を実行

      ```shell
        bundle exec rails db:migrate
      ```

      参考: https://qiita.com/fuku_tech/items/a380ebb1fd156c14c25b

  3.  **サーバーを立ち上げる**

      ```shell
      yarn add -D webpack-cli
      bundle exec rails server
      ```
      http://localhost:3000 にアクセスしてサイトを閲覧

- ## 外部公開設定
  ###  [Heroku](https://www.heroku.com/)を使って外部に公開する

  1.  **デプロイ設定**

      https://qiita.com/murakami-mm/items/9587e21fc0ed57c803d0 を参考に設定

  2.  **デプロイ方法**
      ```shell
      git push heroku <ブランチ名>:master
      heroku rake db:migrate
      heroku open
      ```
      or

      [![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)
