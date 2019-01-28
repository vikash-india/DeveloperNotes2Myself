# Description: DKIM Setup

### Generate Public/Private Key Pairs
```
# Key 1 - Generate private key
openssl genrsa -out example.com.application.pem 1024

# Key 1 - Extract public key
openssl rsa -in example.com.application.pem -out example.com.application.pub -pubout

# Key 1 - Extract public key and encode it in DER format
openssl rsa -in example.com.application.pem -pubout -outform DER -out example.com.application.der

# Key 1 - Transforms the private key from PKCS#1 to PKCS#8 format (unencrypted) and DER encoding
openssl pkcs8 -topk8 -inform PEM -outform DER -in example.com.application.pem -out example.com.application.der -nocrypt

# Key 2 - Generate private key
openssl genrsa -out example.com.google.pem 1024

# Key 2 - Extract public key
openssl rsa -in example.com.google.pem -out example.com.google.pub -pubout

# Key 2 - Extract public key in DER format
openssl rsa -in example.com.google.pem -pubout -outform DER -out example.com.google.der

# Key 2 - Transforms the private key from PKCS#1 to PKCS#8 format (unencrypted) and DER encoding
openssl pkcs8 -topk8 -inform PEM -outform DER -in example.com.google.pem -out example.com.google.der -nocrypt
```

### Install Public Key as DNS TXT Record
``` 
# Install the public key (.pub) as a DNS TXT record for both the selectors - application and google.

# DKIM Setup for application selector
Name    : application._domainkey.example.com.
Type    : TXT
TTL     : 300
Value   : "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQD9VvxhX10N5HMQs10UU5IlmHK95dpJ8OovWOpbHa/F1KISeJJPTHvVizjDthwTOlApPyWdc+u7LorQzwtIXAOc4Xxoe1hTkXZAFbobyXCuBMT/TlvqYt5b1pxbyirlzKjDChnB2WRR8PDfa9KuNcn1Fm3nzj80+LR/q6C9PZG+hwIDAQAB"

# DKIM Setup for google selector
Name    : google._domainkey.example.com.
Type    : TXT
TTL     : 300
Value   : "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDGJ8KmHp08xevm99mZllxOP24fBk9rcaj4Pzn4dAEbQvqAfLj6XpBUQEa0xPvODyN2IkCvgi6iqVYyFph2Q5zIFrc7Y1nbvxIu7pMcSbH9qBNSBDfJOkJVx2K3y5V+hPgxWDN4F83r0OfjLCgGEmRLi0eyAugGHb+kLSQ37m/dFwIDAQAB"
```

### Install dkimpy Python Package
```
# Switch to appropriate python virtual environment
v DeveloperNotes2Myself

# Install dkimpy package
pip install dkimpy
```

### Send Emails Signed Using DKMI
* Check the file `004_SendEmail_UsingSMTPRelay_WithDKIM.py` on how to sign using DKIM keys.

### TODO
* None
