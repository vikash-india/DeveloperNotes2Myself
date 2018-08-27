# Description: Send an HTTP Request Using Python Library - Requests

# Note:
# 1. Use this script along with Burpsuite to examine RAW HTTP Requests and HTTP Responses.

import requests

# HTTP URL
httpUrl = "http://posttestserver.com/post.php"

# HTTP GET Parameters as python dictionary
httpGetParameters = {
                     'key1': 'Value for 1',
                     'key2': 'Value for 2',
                     'key3': None
                     }

# Run burpsuite on port 8080 and use that as a proxy
proxies = {
  "http": "http://127.0.0.1:8080"
}

# Make an HTTP Request
httpResponse = requests.get(httpUrl, params = httpGetParameters)                        # Call without using Proxy
#httpResponse = requests.get(httpUrl, params = httpGetParameters, proxies = proxies)    # Call using Proxy

# Examine relevant information
print("-" * 20 + " URL")                                                # Encoded URL
print(httpResponse.url)

print("\n" + "-" * 20 + " HTTP Request Message Header Dictionary")      # HTTP Request Header
print(httpResponse.request.headers)

print("\n" + "-" * 20 + " HTTP Response Message Header Dictionary")     # HTTP Response Header
print(httpResponse.headers)

print("\n" + "-" * 20 + " HTTP Response Status Code")                   # HTTP Response Status Code
print(httpResponse.status_code)

print("\n" + "-" * 20 + " HTTP Response Encoding")                      # HTTP Response Encoding
print(httpResponse.encoding)

print("\n" + "-" * 20 + " HTTP Response Text")                          # HTTP Response Text
print(httpResponse.text)

print("\n" + "-" * 20 + " HTTP Response Content")                       # HTTP Response Content
print(httpResponse.content)
