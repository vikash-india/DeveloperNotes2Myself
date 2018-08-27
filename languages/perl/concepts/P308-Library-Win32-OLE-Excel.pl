# Description: Using Win32::OLE module to read an excel
# Note: Needs the file 107-DataSample.xls
use Win32::OLE qw(in with);
use Win32::OLE::Const 'Microsoft Excel';

$Win32::OLE::Warn = 3;											# Die on errors

my $Excel = Win32::OLE->GetActiveObject('Excel.Application')    # Get already active excel object
    || Win32::OLE->new('Excel.Application', 'Quit');			# Or open a new application

# Open Excel file
my $Book = $Excel->Workbooks->Open("D:\\perfios\\Workspace\\PerlProject\\concepts\\107-DataSample.xls");

my $Sheet = $Book->Worksheets(1);						        # Select worksheet number 1
my $array = $Sheet->Range("A1:B5")->{'Value'};			        # Get the contents
$Book->Close;

foreach my $ref_array (@$array) {                               # Loop through the array
    foreach my $scalar (@$ref_array) {                          # Referenced by $array
        print "$scalar\t";
    }
    print "\n";
}
