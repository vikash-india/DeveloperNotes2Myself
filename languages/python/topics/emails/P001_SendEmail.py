# Description: Compose Email Using the email Module And Send Email Using the smtplib Module

import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from P101_ConfigManager import ConfigManager

# The email Module
# 1. The email module contains many classes and functions for managing email messages, including MIME and other
#    RFC 2822-based message documents.
# 2. It is specifically NOT designed to do any sending of email messages to SMTP (RFC 2821), NNTP, or other servers;
#    those are functions of modules such as smtplib and nntplib.

# Read SMTP and Email details from the config file
CONFIG_FILE='P000_SendEmail.config'
configManager = ConfigManager()
configManager.read(CONFIG_FILE)

SMTP_SERVER = configManager.get('SMTP', 'smtp.server')                          # SMTP Server
SMTP_PORT = configManager.get('SMTP', 'smtp.server.port')                       # SMTP Server Port
FROM_EMAIL_ID = configManager.get('SMTP', 'from.email.id')                      # FROM Email Id
FROM_EMAIL_ID_PASSWORD = configManager.get('SMTP', 'from.email.id.password')    # From Email Id Password

TO_EMAIL_ID = configManager.get('Emails', 'to.email.id.1')                      # TO Email Id

# Use email module to compose an email
EMAIL_SUBJECT = 'Coursera Website'                                              # Email SUBJECT
EMAIL_BODY = 'Please visit www.coursera.org.'                                   # Email BODY

message = MIMEMultipart()
message['From'] = FROM_EMAIL_ID
message['To'] = TO_EMAIL_ID
message['Subject'] = EMAIL_SUBJECT
message.attach(MIMEText(EMAIL_BODY, 'plain'))

# The smtplib Module
# 1. The smtplib module defines an SMTP client session object that can be used to send mail to any Internet machine
#    with an SMTP or ESMTP listener daemon.
# 2. Google SMTP Servers Details:
#    - Server: 'smtp.gmail.com', Port: 587
#    - Server: 'smtp.googlemail.com', Port: 465
# 3. Google blocks sign-in attempts from apps which do not use modern security standards mentioned on their support
#    page https://support.google.com/accounts/answer/6010255?hl=en.
#    - Turn On the access for less secure app using the URL https://www.google.com/settings/security/lesssecureapps.
#    - Visit URL https://support.google.com/accounts/answer/6009563 and follow steps for
#       * You're signing in from a new location or device
#       * Your device or app may not support Google's security standards (Allow less secure apps)
#       * Still having trouble signing in?

# Send email using smtplib module
server = smtplib.SMTP(SMTP_SERVER, SMTP_PORT)
# server.set_debuglevel(True)                                                   # Enable Debug (If Required)
server.starttls()
server.login(FROM_EMAIL_ID, FROM_EMAIL_ID_PASSWORD)
text = message.as_string()
server.sendmail(FROM_EMAIL_ID, TO_EMAIL_ID, text)
server.quit()
