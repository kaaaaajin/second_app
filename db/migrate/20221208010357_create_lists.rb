# コマンド↓ rails g model (モデル名)
# modelを作成するとmigrationファイルが自動生成される
# migrationファイルは、テーブルの作成や変更を管理するファイル
# 記述される内容によってテーブル名やカラム名、テーブルの列などが決定する
class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
# listsがテーブル名,テーブル名はモデル名の複数形が自動的に割り振られる
# カラムを定義　t.データ型：カラム名
# migrationファイルをデータベースに反映し、テーブルを作成する
# コマンドは↓　rails db:migrate
# テーブル作成後、db/schema.rbにて作成できているか確認。※schema.rbを編集してもテーブルには反映されないので注意