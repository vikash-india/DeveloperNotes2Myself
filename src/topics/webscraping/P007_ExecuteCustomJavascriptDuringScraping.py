from selenium import webdriver
import time

# Executing Custom Javascript
# 1. Custom javascript can be executed using driver.execute_script() method.

# Create an instance of Phantomjs WebDriver
driver = webdriver.PhantomJS(service_args=['--ssl-protocol=any'])
#driver = webdriver.Firefox()

driver.set_window_size(1120, 550)

# Navigate to a page using the HTTP Get URL
driver.get("https://www.rbi.org.in/scripts/referenceratearchive.aspx")

# Execute custom javascript code to remove the readonly attribute from the form fields so that the fields can be set.
driver.execute_script("document.getElementsByName('txtFromDate')[0].removeAttribute('readonly');")
driver.execute_script("document.getElementsByName('txtToDate')[0].removeAttribute('readonly');")

# Fill form fields
driver.find_element_by_id('chkGBP').click()                                     # Click Checkbox
driver.find_element_by_id('chkYEN').click()                                     # Click Checkbox
driver.find_element_by_id('chkUSD').click()                                     # Click Checkbox
driver.find_element_by_id('chkEURO').click()                                    # Click Checkbox
driver.find_element_by_id('txtFromDate').send_keys('01/05/2016')                # Set from date
driver.find_element_by_id('txtToDate').send_keys('31/05/2016')                  # Set to date

# Click on submit form button
time.sleep(3)
driver.find_element_by_id('btnSubmit').click()

# Get response
print driver.current_url
print driver.page_source

# Quit
driver.quit()
