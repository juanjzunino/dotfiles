from selenium import webdriver
from selenium.webdriver.common.keys import Keys

# Tracks IDs
book_id = {'Python for Data Analysis': 'RU835292822NL'}

# Activate web driver
driver = webdriver.Chrome('/Users/juanjozunino/Documents/chromedriver')

for k, v in book_id.items():
    # Home page
    driver.get('https://postnl.post/')

    # Submit track id
    track = driver.find_element_by_name('barcodes')
    track.click()
    track.send_keys(v)

    find_button = driver.find_element_by_id('btnZoek-revised')
    find_button.click()

    # Retrieve information
    information = driver.find_element_by_class_name('table-wrapper')
    text = information.text.split('\n')[2]
    text = text.split()[:-1]
    text = ' '.join(text)


    # Print information
    print('-'*10)
    print(f'{k.upper()} - {v}')
    print(text)
    print('-'*10, end='\n\n')

# Close driver
driver.quit()
