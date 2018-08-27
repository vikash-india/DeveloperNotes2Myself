import mechanize
import cookielib

# Browser initialization
browser = mechanize.Browser()

# Browser options initialization
browser.set_handle_robots(False)

# Browser debug options initialization
# browser.set_debug_http(True)
# browser.set_debug_redirects(True)
# browser.set_debug_responses(True)

# Browser HTTP headers initialization
browser.addheaders = [('Host', 'posttestserver.com'),
                      ('Connection', 'Close'),
                      ('User-agent', 'mechanize/0.2.5 CPython/2.7.6 Linux/3.13.0-43-generic')]

# Cookie Jar initialization
cookieJar = cookielib.LWPCookieJar()
browser.set_cookiejar(cookieJar)

# Set HTTP GET URL and make HTTP Request
response = browser.open('http://posttestserver.com/post.php')
html = response.read()

# Examine relevant information
print("-" * 20 + " HTTP URL")
print browser.geturl()                                          # HTTP GET URL.

print("\n" + "-" * 20 + " HTTP Request Headers - Dictionary")
request = browser.request                                       # HTTP Request Headers - Dictionary.
print request.header_items()

print("\n" + "-" * 20 + " HTTP Response Headers")
print response.info()                                           # HTTP Response Headers.

print("\n" + "-" * 20 + " HTTP Response Encoding")
print browser.encoding()                                        # HTTP Response Encoding.

print("\n" + "-" * 20 + " HTTP Response Message Body")
print html                                                      # HTTP Response Message body.
#print browser.response().read()                                # Same as above.
