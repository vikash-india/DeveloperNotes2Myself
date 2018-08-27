#######################################################################################################
# Description: GetNDaysBeforeDate
# Notes: 
#       1. The Perl keyword last breaks the loop and causes control to be thrown to the first statement following the loop
#       2.  
#######################################################################################################

my @monthDays = (31,28,31,30,31,30,31,31,30,31,30,31);
sub getNDaysBeforeDate
{
    my $startDate      = shift;
    my $numberOfDays   = shift;
    if(!(defined $startDate && defined $numberOfDays))
    { 
        print "Error: Number Of Parameter does not match\n";
        print "Usage: getNdaysOlderDate(StartDate, NumberOfDays)\n";
        return;
    }
    #print "Parameters: $startDate, $numberOfDays\n";
    $startDate =~ m/(..)([\/-])(..)\2(....)/;
    my $delimiter   = $2;
    my $date        = $1;
    my $month       = $3;
    my $year        = $4;

    #print "After Regex: Day: $date, Month: $month, Year: $year\n";
    $date        = $date - $numberOfDays;
    while($date <= 0)
    {
        if (--$month == 0)
        { 
            $month = 12; 
            --$year; 
        }
        $date += $monthDays[$month-1];
        if ($month == 2 && ($year % 4) == 0)
        {
          ++$date; #Leap Year  
        } 
    }
    if (length($month) != 2)
    {
        $month = "0$month";
    }
    if (length($date) != 2)
    {
        $date = "0$date";
    }
    #print "New Date: $date$delimiter$month$delimiter$year\n";
    return "$date$delimiter$month$delimiter$year";        
}

sub getDateAsNumber
{
    my $date = shift;       # The date should be in form of DD/MM/YYYY or DD-MM-YYYY
    $date =~ m/(..)([\/-])(..)\2(....)/is;
    return "$4$3$1";      # Return the number YYYYMMDD
}

my $fromDate = '03/10/2007';
my $toDate = '03/10/2008';
my $daysRange = 90;
print "From Date: $fromDate\n";
print "To Date: $toDate\n";

#getNdaysBeforeDate($toDate, 3);
#getNdaysBeforeDate('30-09-2008', 3);
#exit 0;

my $dt1 = $toDate;
my $dt2;
$var = 1;
$dt2 = getNDaysBeforeDate($dt1, $daysRange);
while($var)
{
    if (getDateAsNumber($fromDate) >= getDateAsNumber($dt2))
    {
        print $fromDate," To ",$dt1,"\n";
        $var = 0;
    }
    else
    {
        print $dt2," To ",$dt1,"\n";
        $dt1 = getNDaysBeforeDate($dt2, 1);
        $dt2 = getNDaysBeforeDate($dt1, $daysRange);
    }
}
