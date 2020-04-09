import requests

url_items = 'https://fathomless-atoll-84580.herokuapp.com/fav/add'
#url_items = 'http://localhost:3000/fav/add'

datas = [
    {"user_id": "1", "content_id": "2"},
    {"user_id": "2", "content_id": "1"},
    {"user_id": "1", "content_id": "5"},
    {"user_id": "2", "content_id": "3"}
]

for data in datas:
    r_get = requests.post(url_items, params=data)
    print(r_get.text)