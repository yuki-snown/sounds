# Sounds API

- ### 開発環境はGemfileに記載

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

## DB確認用

### usersのtableの確認

> https://cryptic-basin-01283.herokuapp.com/users

### contentsのtableの確認

> https://cryptic-basin-01283.herokuapp.com/contents

### favoritesのtableの確認

> https://cryptic-basin-01283.herokuapp.com/favorites


## 情報の登録

### 音楽登録

> https://cryptic-basin-01283.herokuapp.com/resister

```
    params: 
        user_id: integer
        title: string
        image: binary
        sound: binary

    ex. https://cryptic-basin-01283.herokuapp.com/resister?user_id=1&title=hoge&image=hogehogehoge&sound=hogehogehoge

    成功時: {"status":"success"}

    失敗持: {"status":"failed"}

```

### お気に入り登録
> https://cryptic-basin-01283.herokuapp.com/fav/add

```
    params: 
        user_id: integer
        content_id: integer

    ex. https://cryptic-basin-01283.herokuapp.com/resister?user_id=1&content_id=2

    成功時: {"status":"success"}

    失敗持: {"status":"failed"}

```

### ユーザの登録
> https://cryptic-basin-01283.herokuapp.com/user/add

```
    params: 
        username: string
        password: string

    ex. https://cryptic-basin-01283.herokuapp.com/user/add?username=hoge&password=hogehoge

    成功時: {"status":"success"}

    失敗持: {"status":"failed"}

```

## 自分が投稿した音楽
> https://cryptic-basin-01283.herokuapp.com/post

```
    params: 
        username: string

    ex. https://cryptic-basin-01283.herokuapp.com/post?username=hoge

    return json 
    対象ユーザの全投稿が返ってくる
    {
        id:hoge,
        user_id:hoge,
        title; hoge,
        image: hoge,
        sound: hoge
    }

```

## タイトル検索
> https://cryptic-basin-01283.herokuapp.com/search

```
    params: 
        title: string

    ex. https://cryptic-basin-01283.herokuapp.com/search?title=hoge

    return json 
    タイトルに部分一致したコンテンツが全て返ってくる。
    {
        id:hoge,
        user_id:hoge,
        title; hoge,
        image: hoge,
        sound: hoge
    }

```

## 直近のN件を取得
> https://cryptic-basin-01283.herokuapp.com/current

```
    params: 
        num: integer

    ex. https://cryptic-basin-01283.herokuapp.com/current?num=hoge

    return json 
    num件だけランダムでコンテンツを返す。
    {
        id:hoge,
        user_id:hoge,
        title; hoge,
        image: hoge,
        sound: hoge
    }

```

## 閲覧する際のデータ取得
> https://cryptic-basin-01283.herokuapp.com/show

```
    params: 
        id: integer *content_id

    ex. https://cryptic-basin-01283.herokuapp.com/show?id=hoge

    return json 
    閲覧予定コンテンツとランダム抽出のコンテンツ10件を返す。
    {
        "main":{
            id:hoge,
            user_id:hoge,
            title; hoge,
            image: hoge,
            sound: hoge
        }
        "other"{
            id:hoge,
            user_id:hoge,
            title; hoge,
            image: hoge,
            sound: hoge
            .....
        }
    }

```

## お気に入り呼び出し
> https://cryptic-basin-01283.herokuapp.com/fav/search

```
    params: 
        user_id: integer

    ex. https://cryptic-basin-01283.herokuapp.com/fav/search?user_id=hoge

    return json 
    指定されたユーザがファボってるコンテンツを全て返す。
    {
        id:hoge,
        user_id:hoge,
        title; hoge,
        image: hoge,
        sound: hoge
    }
