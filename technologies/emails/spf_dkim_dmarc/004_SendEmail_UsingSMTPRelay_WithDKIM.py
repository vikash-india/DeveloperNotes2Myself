# Description: Send Mail With DKIM Using SMTP Relay

import dkim
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

# SMTP Relay Parameters
smtp_relay = ""
smtp_relay_port = 587
smtp_relay_username = ""
smtp_relay_password = ""

# DKIM Parameters
dkim_private_key_path = "004-example.com.application.pem"
dkim_selector = "application"

# Create message object instance
smtp_message = MIMEMultipart()

# Email Details
smtp_message['From'] = "mailer@example.com"
smtp_message['To'] = "dilbert@gmail.com"
smtp_message['Subject'] = "Message From {0} Using {1} With DKIM".format(smtp_message['From'], smtp_relay)

# Add Email message body
email_body = "Mail sent by {0} using SMTP relay {1} With DKIM".format(smtp_message['From'], smtp_relay)
smtp_message.attach(MIMEText(email_body, 'plain'))

# Add DKIM Signature
sender_domain = smtp_message['From'].split("@")[-1]
if dkim_private_key_path and dkim_selector:
    with open(dkim_private_key_path) as fh:
        dkim_private_key = ''.join(fh.read())

    headers = ['To', 'From', 'Subject']
    dkim_signature = dkim.sign(
        message=smtp_message.as_string(),
        selector=str(dkim_selector),
        domain=sender_domain,
        privkey=dkim_private_key,
        include_headers=headers,
    )
    smtp_message["DKIM-Signature"] = dkim_signature.lstrip("DKIM-Signature: ")

# Create server
server = smtplib.SMTP(host=smtp_relay, port=smtp_relay_port)
server.starttls()

# Login Credentials for sending the mail
server.login(smtp_relay_username, smtp_relay_password)

# Send the message via the server.
server.sendmail(smtp_message['From'], smtp_message['To'], smtp_message.as_string())

# Close
server.quit()

print ("Email sent SUCCESSFULLY to {0}.".format(smtp_message['To']))
