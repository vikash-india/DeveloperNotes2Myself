# Description: Win32::ODBC module to access database
# TODO: Reconfigure to access MySQL
use Win32::ODBC;

my($db) = new Win32::ODBC("dsn=SampleDB; uid=admin; pwd=root");

# This statement also gets compiled.
my($statement) = "SELECT * FROM TEAM";	# semicolon(;) is not required.

# Executing the statement
if ($db->Sql($statement))
{
    my($errorNumber, $errorConnectionNumber, $errorText) = $db->Error;
    warn "Sql() ERROR\n";
    warn "\t\Statement: $statement\n";
    warn "\t\Error:  $errorNumber\t $errorConnectionNumber\t $errorText\n";
    exit;
}

# Extracting the rows
while ($db->FetchRow()) {
    my(%data) = $db->DataHash();
    print $data{'TEAM_ID'}."\t".$data{'NAME'}."\n";
}
