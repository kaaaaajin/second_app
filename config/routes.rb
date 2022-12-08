# コマンド↓ rails g controller コントローラ名　アクション名
# アクション名を指定することで関連するファイルやコードを一度で全て作成できる
# モデルを扱うコントローラでは、データを操作するためのアクションを定義するのが一般的
# new index show edit 等　create update destroyはviewが必要ないアクションのため省略

Rails.application.routes.draw do
  get 'lists/new'
# フォームを記述したビューを表示するためのルーティング
  post 'lists' => 'lists#create'
# データを追加（保存）するためのルーティング
# コントローラ作成時にアクション名を入れていないため自動生成されていない
  get 'lists' => 'lists#index'
  
  get 'lists/:id' => 'lists#show',as: 'list'
# どの投稿データを表示するかを判別するために、投稿データのidもurlに含める
# 名前付きルートはasオプションを追加することが設定できる
# 'lists#show'の設定をlistとして利用でき、それをredirect_toやlink_toでも使用することができる
  
  get 'lists/:id/edit' => 'lists#edit',as: 'edit_list'
  
  get '/top' => 'homes#top'
  
  patch 'list/:id' => 'lists#update',as: 'update_list'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
