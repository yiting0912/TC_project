import requests
from bs4 import BeautifulSoup

url = "https://tcshop.com.tw/collections/all"
headers = {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36"}
response = requests.get(url, headers=headers)
# print(response)
soup = BeautifulSoup(response.text, "html.parser")

# tc_product = soup.select_one("main > div > div > div.grid-uniform.grid-link__container > div:nth-child(1) > div > a")
# # print(tc_product)
# tc_name = product.select_one(".grid-link__title").text.strip()
# print(tc_name)
# tc_price = product.select_one(".money").text.strip()
# print(tc_price)

for tc_product in soup.select("div.grid-link"):
    name = tc_product.select_one(".grid-link__title").text.strip()
    price = tc_product.select_one(".money").text.strip()
    # print(f"{name}\t{price}")
    # print(name)
    price = price[4:]
    print(price)