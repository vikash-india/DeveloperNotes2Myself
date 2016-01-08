# Description: Compose and Send an Email With Different Reply-To Header

import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.utils import formataddr

from P101_ConfigManager import ConfigManager

# Read SMTP and Email details from the config file
CONFIG_FILE='P000_SendEmail.config'
configManager = ConfigManager()
configManager.read(CONFIG_FILE)

SMTP_SERVER = configManager.get('SMTP', 'smtp.server')                              # SMTP Server
SMTP_PORT = configManager.get('SMTP', 'smtp.server.port')                           # SMTP Server Port
FROM_EMAIL_ID = configManager.get('SMTP', 'from.email.id')                          # FROM Email Id
FROM_EMAIL_ID_SENDER_NAME = configManager.get('SMTP', 'from.email.id.sender.name')  # From Sender Name
FROM_EMAIL_ID_PASSWORD = configManager.get('SMTP', 'from.email.id.password')        # From Email Id Password

TO_EMAIL_ID_1 = configManager.get('Emails', 'to.email.id.1')                        # First TO Email Id
TO_EMAIL_ID_1_SENDER = configManager.get('Emails', 'to.email.id.1.sender.name')     # First TO Email Sender Name
TO_EMAIL_ID_2 = configManager.get('Emails', 'to.email.id.2')                        # Seconds TO Email Id
TO_EMAIL_ID_2_SENDER = configManager.get('Emails', 'to.email.id.2.sender.name')     # Seconds TO Email Sender Name
TO_EMAIL_ID_3 = configManager.get('Emails', 'to.email.id.3')                        # Thirds TO Email Id
TO_EMAIL_ID_3_SENDER = configManager.get('Emails', 'to.email.id.3.sender.name')     # Thirds TO Email Sender Name

# Compose email using the email module.
FORMATTED_FROM_EMAIL_ID = formataddr((FROM_EMAIL_ID_SENDER_NAME, FROM_EMAIL_ID))    # Formatted FROM Email Id
FORMATTED_TO_EMAIL_IDS = [                                                          # List of Formatted TO Email Ids
    formataddr((TO_EMAIL_ID_1_SENDER, TO_EMAIL_ID_1)),
    formataddr((TO_EMAIL_ID_2_SENDER, TO_EMAIL_ID_2))
]
EMAIL_SUBJECT = 'Coursera Website 29'                                               # Email SUBJECT
EMAIL_BODY = 'Please visit www.coursera.org.'                                       # Email BODY

message = MIMEMultipart()
message['From'] = FORMATTED_FROM_EMAIL_ID
message['To'] = ', '.join(FORMATTED_TO_EMAIL_IDS)
message['Subject'] = EMAIL_SUBJECT

# Add this info to use different reply-to address
REPLY_TO_ADDRESS = TO_EMAIL_ID_3                                                    # Different Reply-To address
message.add_header('reply-to', REPLY_TO_ADDRESS)

message.attach(MIMEText(EMAIL_BODY, 'plain'))

# Send mail using the smtplib module.
server = smtplib.SMTP(SMTP_SERVER, SMTP_PORT)
# server.set_debuglevel(True)                                                       # Enable Debug (If Required)
server.starttls()
server.login(FROM_EMAIL_ID, FROM_EMAIL_ID_PASSWORD)
text = message.as_string()
server.sendmail(FROM_EMAIL_ID, FORMATTED_TO_EMAIL_IDS, text)                        # Add TO, CC, BCC in envelope.
server.quit()
