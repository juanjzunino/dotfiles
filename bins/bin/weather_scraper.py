import pandas as pd
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import requests
from bs4 import BeautifulSoup

# Data objects
df = {
        'year': [],
        'time': [],
        'rain': [],
}

# Activate web driver
driver = webdriver.Chrome('/Users/juanjozunino/Documents/chromedriver')

# Web URL
year = 2018
url = f'https://www.wunderground.com/history/daily/us/ky/florence/KCVG/date/{year}-10-30'

# Home Page
driver.get(url)

# Parse HTML
soup = BeautifulSoup(driver.page_source, 'html.parser')

# Quit driver
driver.quit()

table = soup.find_all('table')[-1]

body = table.find('tbody')

table_rows = body.find_all('tr')

for row in table_rows:
    row_elements = row.find_all('td')
    elements = []
    for element in row_elements:
        elements.append(element.text)
    df['year'].append(year)
    df['time'].append(elements[0])
    df['rain'].append(elements[8])

cincinnati_rain = pd.DataFrame(data=df)

print(cincinnati_rain)
