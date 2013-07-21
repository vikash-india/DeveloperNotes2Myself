# Description: Using DBI module
# TODO: Reconfigure to access MySQL
use DBI;

$dbname = 'aedb009d';
$user = 'hlwfxtcap1';
$password = 'hlwfxtcap1';
$dbd = 'Oracle';
#$dbh = DBI->connect ($dbname, $user, $password,# $dbd); # This is a old style syntax

my $dbh = DBI->connect( "dbi:Oracle:$dbname", $user , $password )
   or die "Can't connect to Oracle database: $DBI::errstr\n";


if (!$dbh) {
     print "Error connecting to database; $DBI::errstr\n";
}

$cur = $dbh->prepare('select * from team'); # For compiling the statement
$cur->execute();
die "Prepare error: $DBI::err .... $DBI::errstr" if $DBI::err;
while (($Team_ID, $Name) = $cur->fetchrow) {
    print "$Team_ID \t $Name\n";
}
$cur->finish();