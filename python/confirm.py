import requests
import ast

url_items = 'https://fathomless-atoll-84580.herokuapp.com/contents'
#url_items = 'http://127.0.0.1:3000/contents'
r_get = requests.get(url_items)
print(r_get.text)