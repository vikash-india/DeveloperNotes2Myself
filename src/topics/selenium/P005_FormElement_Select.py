from selenium import webdriver
import time

driver = webdriver.Firefox()
driver.set_window_size(1120, 550)

driver.get("https://www.nseindia.com/products/content/equities/indices/historical_index_data.htm")

# The select element
"""
<select name="indexType" id="indexType">
    <option value="NIFTY 50" selected>Nifty 50</option>
    <option value="NIFTY NEXT 50">Nifty Next 50</option>
    <option value="NIFTY100 LIQ 15">Nifty100 LIQ 15</option>
    ...
</select>
"""
# Method 1: Using WebDriver's Element Class
# element = driver.find_element_by_id("indexType")
# select_options = element.find_elements_by_tag_name("option")
# for option in select_options:
#     print("Option [value=%s]" % option.get_attribute("value"))
#     option.click()

# Method 2: Using WebDriver's Select class
# 1. WebDriver's supports 'Select' class, which provides useful methods for interacting with it.
from selenium.webdriver.support.ui import Select

select = Select(driver.find_element_by_id('indexType'))
select.select_by_index(1)                               # Select using option index
select.select_by_visible_text('Nifty Next 50')          # Selection using option text
select.select_by_value('NIFTY100 LIQ 15')               # Select using option value

# Get all available options
time.sleep(2)
options = select.options
for option in options:
    print option.get_attribute("value")

# List all default selected options
time.sleep(2)
all_selected_options = select.all_selected_options
for option in all_selected_options:
    print option.get_attribute("value")

# Deselect all the selected options
time.sleep(2)
# select.deselect_all() # Only if it's a multiselect element

# Quit
time.sleep(2)
driver.quit()
