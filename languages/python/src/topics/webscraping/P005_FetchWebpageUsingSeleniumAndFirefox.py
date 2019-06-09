from selenium import webdriver

# Create an instance of Firefox WebDriver
driver = webdriver.Firefox()
driver.set_window_size(1120, 550)

# Navigate to a page using the HTTP Get URL
# WebDriver will wait until the page has fully loaded (that is, the 'onload' event has fired) & then return the control.
driver.get("https://www.nseindia.com/products/content/equities/indices/historical_index_data.htm")

# Set HTTP GET paramter by finding elements using one of the find_element_by_* methods
element = driver.find_element_by_id('indexType')
element.send_keys('NIFTY 50')

# Set HTTP GET parameters
driver.find_element_by_id('fromDate').send_keys('01-05-2016')
driver.find_element_by_id('toDate').send_keys('31-05-2016')

# Click Button
driver.find_element_by_id('get').click()

# Print URL and the Page Content
print driver.current_url
print driver.page_source

# Quit
driver.quit()
