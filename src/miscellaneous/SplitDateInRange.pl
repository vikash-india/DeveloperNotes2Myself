#######################################################################################################
# Description: Split Date in Range
# Notes: 
#       1. 
#       2.  
#######################################################################################################
use DateTime;
use DateTime::Format::Strptime;

sub splitDates
{
    my $fromDateString  = shift;
    my $toDateString    = shift;
    my $dateRange       = shift;
    
    $fromDateString =~ m/(..)\/(..)\/(....)/;
    my $fromDate = DateTime->new(year => $3, month  => $2,  day => $1);

    $toDateString =~ m/(..)\/(..)\/(....)/;
    my $toDate = DateTime->new(year => $3, month  => $2,  day => $1);

    # Array to be returned
    my @splittedDates;

    # print for Debugging purpose
    print "From Date:", $fromDate->date(), "\n";
    print "To Date  :", $toDate->date(), "\n";
    
    # Date Formatter
    my $Strp = new DateTime::Format::Strptime(pattern => '%d/%m/%Y');
    my $dt;
    for ($dt = $toDate->clone(); $dt > $fromDate; $dt->subtract(days => $dateRange))
    {
        print $Strp->format_datetime($dt), "\n";
        push @splittedDates, $Strp->format_datetime($dt);
    }
    print $Strp->format_datetime($fromDate), "\n";;
    push @splittedDates, $Strp->format_datetime($dt);
    
    return @splittedDates;
}

my @datesArray = splitDates('25/09/2008', '02/10/2008', 2);
print "Date Array: ", join(",",@datesArray), "\n";

for (my $counter=0; $counter<@datesArray-1; $counter++)
{
    print $datesArray[$counter+1], "  to  ", $datesArray[$counter], "\n";    
}
