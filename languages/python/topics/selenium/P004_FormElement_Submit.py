from selenium import webdriver
import time

driver = webdriver.Firefox()
driver.set_window_size(1120, 550)

driver.get("https://www.nseindia.com/products/content/equities/indices/historical_index_data.htm")

# Set the elements
driver.find_element_by_id('indexType').send_keys('NIFTY 50')
driver.find_element_by_id('fromDate').send_keys('01-05-2016')
driver.find_element_by_id('toDate').send_keys('31-05-2016')

# Submit button using id
element = driver.find_element_by_id('get')
element.click()

# 1. WebDriver has the convenience method 'submit' on every element.
# 2. If you call this on an element within a form, WebDriver will walk up the DOM until it finds the enclosing form and
#    then calls submit on that.
# 3. If the element isn’t in a form, then the NoSuchElementException will be raised:
element.submit()

# Quit
time.sleep(2)
driver.quit()
