# Sounds API

## 開発環境はGemfileに記載

<br>

# Model
## users
```
    id integer, 外部キー

    username string

    password string
```

## contents
```
    id integer, 外部キー

    create_at timestamp

    user_id integer

    title string

    image binary

    sound binary
```

## favorites
```
    id integer

    user_id integer

    content_id integer
```

# APIエンドポイント

### usersのtableの確認

> https://quiet-retreat-26825.herokuapp.com/users

* return id, title

### contentsのtableの確認

> https://quiet-retreat-26825.herokuapp.com/contents

* return id, title

### favoritesのtableの確認

> https://quiet-retreat-26825.herokuapp.com/favorites

* return id, user_id, content_id


### 音楽登録

> https://quiet-retreat-26825.herokuapp.com/resister

```
    params: 
        user_id: integer
        title: string
        image: binary request.files
        sound: binary request.files

    ex. https://quiet-retreat-26825.herokuapp.com/resister?user_id=1&title=hoge&image=hogehogehoge&sound=hogehogehoge

    成功時: {"status":"success"}

    失敗持: {"status":"failed"}

```

### お気に入り登録
> https://quiet-retreat-26825.herokuapp.com/fav/add

```
    params: 
        user_id: integer
        content_id: integer

    ex. https://quiet-retreat-26825.herokuapp.com/resister?user_id=1&content_id=2

    成功時: {"status":"success"}

    失敗持: {"status":"failed"}

```

### ユーザの登録
> https://quiet-retreat-26825.herokuapp.com/user/add

```
    params: 
        username: string
        password: string

    ex. https://quiet-retreat-26825.herokuapp.com/user/add?username=hoge&password=hogehoge

    成功時: {"status":"success", "id": 1}

    失敗持: {"status":"failed"}

```

### ログイン用
> https://quiet-retreat-26825.herokuapp.com/auth

```
    params: 
        username: string
        password: string

    ex. https://quiet-retreat-26825.herokuapp.com/user/add?username=hoge&password=hogehoge

    成功時: {"status":"success", "id": 1}

    失敗持: {"status":"failed"}

```

### 音楽URL
> https://quiet-retreat-26825.herokuapp.com/sound/content_id


### 画像URL
> https://quiet-retreat-26825.herokuapp.com/image/content_id


### 自分が投稿した音楽
> https://quiet-retreat-26825.herokuapp.com/post

```
    params: 
        username: string

    ex. https://quiet-retreat-26825.herokuapp.com/post?username=hoge

    return json 
    対象ユーザの全投稿が返ってくる
    {
        id:hoge,
        title; hoge,
    }

```

### タイトル検索
> https://quiet-retreat-26825.herokuapp.com/search

```
    params: 
        title: string

    ex. https://quiet-retreat-26825.herokuapp.com/search?title=hoge

    return json 
    タイトルに部分一致したコンテンツが全て返ってくる。
    {
        id:hoge,
        title; hoge,
    }

```

### 直近のN件を取得
> https://quiet-retreat-26825.herokuapp.com/current

```
    params: 
        num: integer

    ex. https://quiet-retreat-26825.herokuapp.com/current?num=hoge

    return json 
    num件だけランダムでコンテンツを返す。
    {
        id:hoge,
        title; hoge,
    }

```

### 閲覧する際のデータ取得
> https://quiet-retreat-26825.herokuapp.com/show

```
    params: 
        id: integer *content_id

    ex. https://quiet-retreat-26825.herokuapp.com/show?id=hoge

    return json 
    閲覧予定コンテンツとランダム抽出のコンテンツ10件を返す。
    {
        "main":{
            id:hoge,
            title; hoge,
        }
        "other"{
            [
                id:hoge,
                title; hoge,
            ],
            [
                id:hoge,
                title; hoge,
            ],
            [
                id:hoge,
                title; hoge,
            ]
            .....
        }
    }

```

### お気に入り呼び出し
> https://quiet-retreat-26825.herokuapp.com/fav/search

```
    params: 
        user_id: integer

    ex. https://quiet-retreat-26825.herokuapp.com/fav/search?user_id=hoge

    return json 
    指定されたユーザがファボってるコンテンツを全て返す。
    {
        id:hoge,
        title; hoge,
    }
```  
<br>

# ドキュメント  
- ## [【要求分析～設計】(ブレーンストーミング)](https://docs.google.com/presentation/d/1mNWX1J8QfB-hAZFYOP1rWPsZEVOfdJL6qjzvunCx0aQ/edit)