# コマンド↓ rails g controller コントローラ名　アクション名
# アクション名を指定することで関連するファイルやコードを一度で全て作成できる
# モデルを扱うコントローラでは、データを操作するためのアクションを定義するのが一般的
# new index show edit 等　create update destroyはviewが必要ないアクションのため省略

class ListsController < ApplicationController
  def new
    @list = List.new
    # viewへ渡すためのインスタンス変数「＠list」に空のmodelオブジェクトを生成
    # インスタンス変数は同じ名前のviewでしか使用できない
  end

  def create
  list =  List.new(list_params)
  list.save
  redirect_to list_path(list.id)
  end
  # フォームから送られてくるデータは保存される前にparamusの中に入る
  # ストロングパラメータの記述は、private以下へ
  # paramusで保存を許可したデータをデータべースに保存するためsaveメソッドを実行
  # 保存後、画面の遷移にredirect_to urlを指定する

  def index
    @lists = List.all
  end
  # allとはListモデルがやりとりしているデータべースのテーブルに保存されている全てのレコードをまとめて取得する

  def show
    @list = List.find(params[:id])
  end
  # findメソッドは引数を受け取りidカラムを引数と比べてレコードを取得してくるメソッド
  # ＊引数のparamsはcreateで出てきたものとは別の意味！idカラムから取得するときはparamsの記述が必要

  def edit
    @list = List.find(params[:id])
  end
# 投稿済みデータの編集をするので、保存されているデータが必要。findメソッドを用いてデータを取得

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
# updateアクションでは、データ更新後に更新結果を詳細画面に表示するためshowアクションにリダイレクトさせる
# そのため、新たなビュー作成は不要
# showアクションにリダイレクトするために、引数には必ずidが必要になる
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to 'lists'
  end
  # データレコードを１件取得
  # destroyメソッドによってテーブルからデータが削除される
  # データ削除後のリダイレクト先は、一覧画面を指す'/lists'（indexアクション）に設定

  private
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end
  #require 送られてきたデータの中からモデル名を指定し、データを絞り込む
  # permit  絞り込んだデータの中から保存を許可するカラムを指定する※カラムの数だけ指定

end
