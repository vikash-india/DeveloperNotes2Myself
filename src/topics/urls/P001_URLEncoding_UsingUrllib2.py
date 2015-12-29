import urllib2

urlString1 = "NIFTY 25"
urlString2 = 'NIFTY A\B\C\D'
urlString3 = '22/01/2014'

# Using urllib2 library
print urllib2.quote(urlString1, safe='')
print urllib2.quote(urlString2, safe='')
print urllib2.quote(urlString3, safe='')
