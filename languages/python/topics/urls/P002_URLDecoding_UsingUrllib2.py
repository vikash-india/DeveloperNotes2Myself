import urllib2

encodedUrl1='NIFTY%2025'
encodedUrl2='NIFTY%20A%5CB%5CC%5CD'
encodedUrl3='22%2F01%2F2014'

# Using urllib2 library
print urllib2.unquote(encodedUrl1)
print urllib2.unquote(encodedUrl2)
print urllib2.unquote(encodedUrl3)


