# Description: Using IO::Socket module to create a server socket
use IO::Socket;

$sock = new IO::Socket::INET (LocalHost => 'VIKASH-LAPTOP',
                              LocalPort => 3000,
                              Proto     => 'tcp',
                              Listen    => 5,
                              Reuse     => 1
                             );
die "Socket could not be created. Reason: $!" unless $sock;
print "Server is ready\n";

#Infinite Loop
while ($new_sock = $sock->accept()) {
    while (defined ($buf = <$new_sock>)) {
        print "Server: $buf";
    }
}

close ($sock);
