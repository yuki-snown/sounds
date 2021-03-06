Rails.application.routes.draw do
  #DB確認用
  get "users" => "users#index"
  get "contents" => "contents#index"
  get "favorites" => "favorites#index"
  #音楽登録API
  post "resister" => "contents#resister"
  #お気に入り登録
  post "fav/add" => "favorites#add"
  #ユーザの登録
  post "user/add" => "users#add"
  #ログイン用
  get "auth" => "users#auth"
  #写真のコンテンツ用
  get "image/:id" => "contents#image"
  #音楽のコンテンツ用
  get "sound/:id" => "contents#sound"
  #自分が投稿した音楽
  get "post" => "users#home"
  get "home" => "contents#home"
  #タイトル検索
  get "search" => "contents#search"
  #直近のN件を取得
  get "current" => "contents#current"
  #閲覧する際のデータ取得
  get "show" => "contents#watch"
  #お気に入り呼び出し
  get "fav/search" => "favorites#search"
  get "fav/show" => "contents#fav"

end
