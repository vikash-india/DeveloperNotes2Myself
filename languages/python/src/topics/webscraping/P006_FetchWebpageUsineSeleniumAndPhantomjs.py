from selenium import webdriver

# Note on service_args=['--ssl-protocol=any'] argument
# 1. Apparently if phantomjs is not told to ignore SSL errors, and some SSL errors are encountered on a site, phantomjs
#    will show up about:blank. There is phantomjs command line option –ignore-ssl-errors to handle this situtation.
# 2. Many sites use ‘https:’ in their URLs, and would redirect the browser 'http:' address to the 'https:' address. In
#    such cases the website does not return an encoded response and instead would return about:blank.
# 3. There is phantomjs commandline option –ssl-protocol which defaults to  defaults to SSL v3 but one of the acceptable
#    alternatives is 'any.' I added '–ssl-protocol=any'. Hence using service_args=['--ssl-protocol=any'].

# Create an instance of Phantomjs WebDriver
driver = webdriver.PhantomJS(service_args=['--ssl-protocol=any'])
driver.set_window_size(1120, 550)

# Navigate to a page using the HTTP Get URL
driver.get("https://www.nseindia.com/products/content/equities/indices/historical_index_data.htm")

# Set HTTP GET parameters
driver.find_element_by_id('indexType').send_keys('NIFTY 50')
driver.find_element_by_id('fromDate').send_keys('01-05-2016')
driver.find_element_by_id('toDate').send_keys('31-05-2016')

# Click Button
driver.find_element_by_id('get').click()

# Print URL and the Page Content
print driver.current_url
print driver.page_source

# Quit
driver.quit()
