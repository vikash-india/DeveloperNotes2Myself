# Description: Using Net::SMTP module to send mails
use Net::SMTP;

# TODO: Reconfigure to use google
$smtp = Net::SMTP->new('MAYA');					# Connect to an SMTP server
$smtp->mail( 'vikash@aztec.soft.net' );			# Use the sender's address here
$smtp->to('vikash@aztec.soft.net');				# Use recipient's address here
$smtp->data();

# Start the mail

# Send the header.
$smtp->datasend("To: Vikash\@aztec.soft.net\n");
$smtp->datasend("From: Vikash\@aztec.soft.net\n");
$smtp->datasend("Subject: Mail from Perl\n");
$smtp->datasend("\n");

# Send the body.
$smtp->datasend("\n\n\t\tHello, World!\n");
$smtp->dataend();								# Finish sending the mail
$smtp->quit;									# Close the SMTP connection
