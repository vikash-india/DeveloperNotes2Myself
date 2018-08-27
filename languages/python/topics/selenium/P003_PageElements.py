from selenium import webdriver

# Note
# 1. Finding and interacting with an HTML form element using one of the find_element_by_* methods.
# 2. Explore all the find_element_by_* methods.

driver = webdriver.Firefox()
driver.set_window_size(1120, 550)

driver.get("https://www.nseindia.com/products/content/equities/indices/historical_index_data.htm")

# The select element
"""
<select name="indexType" id="indexType">
    <option value="NIFTY 50" selected>Nifty 50</option>
    <option value="NIFTY NEXT 50">Nifty Next 50</option>
    <option value="NIFTY100 LIQ 15">Nifty100 LIQ 15</option>
</select>
"""
# Find using id
element = driver.find_element_by_id("indexType")

# Alternatively, find using name
# element = driver.find_element_by_name("indexType")

# Alternatively, fFind using XPath
# 1. If there’s more than one element that matches the query, then only the first will be returned.
# 2. If nothing can be found, a NoSuchElementException will be raised.
# element = driver.find_element_by_xpath("//select[@id='indexType']")

# Set the values
element.send_keys('NIFTY 50')

# Interact with more elements
driver.find_element_by_id('fromDate').send_keys('01-05-2016')
driver.find_element_by_id('toDate').send_keys('31-05-2016')

# Click Button
driver.find_element_by_id('get').click()

# Print URL and the Page Content
print driver.current_url
print driver.page_source

# Quit
driver.quit()
