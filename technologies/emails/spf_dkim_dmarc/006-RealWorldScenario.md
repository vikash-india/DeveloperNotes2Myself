# Description: Real World Scenario

### Real Setup on Example.com
* Office Emails Goes through G Suite
* Application 1 Emails Goes through SMTP Relay - Netcore
* Application 2 Emails Goes through Gmail API

### What is important and what isnt important in DNS
* Mandatory
    - Reverse DNS
* Optional
    - SPF
    - DKIM
    - DMARC
* Unimportant
    - If the message came from an MX
    
    

### Gmail Live Demo
* Without SPF/DKIM/DMARC: Only from, to, date, subject
* With SPF: 
    - Gmail shows the field 'mailed-by'
    - Show Original shows the SPF: Pass with IP 94.123.124.23 in Gmail Header of the original mail.
    - Show Original message shows Received-SPF: pass (google.com: domain of robert.houser@pb.com designates 94.123.124.23 as permitted sender).
* With SPF and DKIM:
    - Gmail shows the field 'signed-by'
    - Show Original shows the DKIM: Pass with domain example.com in Gmail Header of the original mail.
    - Show Original message shows 
        - Dkim=passed under authentication-Results
        - Also shows DKIM-Signature
*  With SPF, DKIM, and DMARC:
    - Gmail shows the field 'mailed-by' and 'signed-by'. No extra field for DMARC
    - Show Original shows the 
        - DKIM: Pass with domain example.com in Gmail Header of the original mail.
        - PF: Pass with IP 94.123.124.23 in Gmail Header of the original mail.
        - DMARC: Pass 
    - Show Original message
        - Received-SPF: pass (google.com: domain of robert.houser@pb.com designates 94.123.124.23 as permitted sender). 
        - Dkim=passed under authentication-Results
        - Also shows DKIM-Signature
        - dmarc=pass


* Use nslookup to check the record
nslookup -q=txt mail._domainkey.pbcom.cz

nslookup -q=txt smtp._domainkey.pbcom.cz

nslookup -q=txt pbcom.cz


* Explore 
    sudo apt install opendkim
    
* Explore
    SPF: http://openspf.org
    DKIM: http://dkim.org
    DMARC: https://dmarc.org/resources/deployment-tools/
    DMARC Generator: www.kitterman.com/dmarc/assistant.html
    
* Look for SPF generator
* Look for DKIM Generator

### TODO
* None
