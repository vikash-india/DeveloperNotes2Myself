# Description: Using IO::Socket module to create a client socket
use IO::Socket;

$sock = new IO::Socket::INET (PeerAddr => 'VIKASH-LAPTOP',
                              PeerPort => 3000,
                              Proto    => 'tcp',
                             );

die "Socket could not be created. Reason: $!\n" unless $sock;

foreach (1 .. 10) {
    print $sock "Client: Sending message $_: How are you?\n";
}

close ($sock);