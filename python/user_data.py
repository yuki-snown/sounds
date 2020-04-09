import requests

url_items = 'https://fathomless-atoll-84580.herokuapp.com/user/add'
#url_items = "http://127.0.0.1:3000/user/add"

datas = [
    {"username": "gopher", "password": "go"},
    {"username": "pythonista", "password": "python"},
    {"username": "myrails", "password": "ruby"}
]

for data in datas:
    r_get = requests.post(url_items, params=data)
    print(r_get.text)