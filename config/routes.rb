Rails.application.routes.draw do
  #resources :favorites
  #resources :contents
  #resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  #DB確認用
  get "users" => "users#index"
  get "contents" => "contents#index"
  get "favorites" => "favorites#index"

  #音楽登録API
  post "resister" => "contents#resister" #OK
  #お気に入り登録
  post "fav/add" => "favorites#add" #OK

  #自分が投稿した音楽
  get "post" => "users#home" #OK
  get "home" => "contents#home" #OK
  #タイトル検索
  get "search" => "contents#search" #OK
  #直近のN件を取得
  get "current" => "contents#current" #OK
  #閲覧する際のデータ取得
  get "show" => "contents#watch" #OK
  #お気に入り呼び出し
  get "fav/search" => "favorites#search" # OK
  get "fav/show" => "contents#fav" #OK

end
