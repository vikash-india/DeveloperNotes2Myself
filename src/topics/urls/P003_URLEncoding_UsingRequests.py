from requests.utils import quote

urlString1 = "NIFTY 25"
urlString2 = 'NIFTY A\B\C\D'
urlString3 = '22/01/2014'

# Using urls library
print quote(urlString1, safe='')
print quote(urlString2, safe='')
print quote(urlString3, safe='')
