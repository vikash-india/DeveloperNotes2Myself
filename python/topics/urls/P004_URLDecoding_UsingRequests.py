from requests.utils import unquote

encodedUrl1='NIFTY%2025'
encodedUrl2='NIFTY%20A%5CB%5CC%5CD'
encodedUrl3='22%2F01%2F2014'

# Using urls library
print unquote(encodedUrl1)
print unquote(encodedUrl2)
print unquote(encodedUrl3)
