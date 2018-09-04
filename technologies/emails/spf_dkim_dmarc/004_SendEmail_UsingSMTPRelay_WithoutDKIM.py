# Description: Send Mail Without DKIM Using SMTP Relay

import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

# SMTP Relay Parameters
smtp_relay = ""
smtp_relay_port = 25
smtp_relay_username = ""
smtp_relay_password = ""

# Create message object instance
smtp_message = MIMEMultipart()

# Email Details
smtp_message['From'] = "mailer@example.com"
smtp_message['To'] = "dilbert@gmail.com"
smtp_message['Subject'] = "Message From {0} Using {1}".format(smtp_message['From'], smtp_relay)

# Add Email message body
email_body = "Mail sent by {0} using SMTP relay {1}".format(smtp_message['From'], smtp_relay)
smtp_message.attach(MIMEText(email_body, 'plain'))

# Create server
server = smtplib.SMTP(host=smtp_relay, port=smtp_relay_port)
server.starttls()

# Login Credentials for sending the mail
server.login(smtp_relay_username, smtp_relay_password)

# Send the message via the server.
server.sendmail(smtp_message['From'], smtp_message['To'], smtp_message.as_string())

server.quit()

print ("Email sent SUCCESSFULLY to {0}.".format(smtp_message['To']))
