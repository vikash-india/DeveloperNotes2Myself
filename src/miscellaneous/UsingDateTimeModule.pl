#######################################################################################################
# Description: Split Two dates into multiple Ranges
# Notes: 
#       1. 
#       2.  
#######################################################################################################
use DateTime;
use DateTime::Format::Strptime;

my $date1 = DateTime->new(year => 2008, month  => 9,  day => 25);
my $date2 = DateTime->today();

my $Strp = new DateTime::Format::Strptime(pattern => '%d/%m/%Y');
my $date3 = $Strp->parse_datetime('01/02/2008');

print "Start Date\t:", $date1->date(), "\n";
print "End Date\t:", $date2->date(), "\n";
print "Parsed Date\t:", $Strp->format_datetime($date3), "\n";;

#$date2->subtract( hours => 1 );
#$date2->add( days => 1 );

#my @dates;

my $dt;
for ($dt = $date2->clone(); $dt > $date1; $dt->subtract(days => 2))
{
    print $Strp->format_datetime($dt), "\n";
    #push @dates,$dt->date();
}
print $Strp->format_datetime($date1), "\n";;
