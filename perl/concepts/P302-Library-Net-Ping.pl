# Description: Using Net::Ping module to ping a host
use Net::Ping;

$host_1 = "VIKASH-LAPTOP";
$host_3 = "127.0.0.1";
$host_2 = "192.168.162.22";

$p = Net::Ping->new();
if ($p->ping($host_1)) {
    print "Host $host_1 is alive\n";
} else {
    print "Host $host_1 is down\n";
}

# Another way
print "Host $host_1 is alive.\n" if $p->ping($host_1);

$p->close();