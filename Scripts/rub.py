import requests
from bs4 import BeautifulSoup



url = "https://www.banki.ru/products/currency/rub/"

response = requests.get(url)
html = response.text

soup = BeautifulSoup(html, 'html.parser')
dollar = soup.find("div", class_="FlexboxGrid__sc-akw86o-0 ybYCl")
course = dollar.find("div", class_="FlexboxGridItem__sc-1crr98y-0 fQGtRy")
rub = course.find("div", class_="Text__sc-j452t5-0 jxxlPG")


print(rub.get_text())
