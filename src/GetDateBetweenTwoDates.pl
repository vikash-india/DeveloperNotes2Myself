#######################################################################################################
# Description: Test Script
# Notes:
#       1.
#       2.
#######################################################################################################
use DateTime;

# Returns an array date strings( format DDMMYYYY) since from_date.
# Note: from_date is included but today is not.
sub get_all_dates_since {
  my $from_date_str = shift;

  my @fetch_date;

  # Parse From Date String
  my ( $day, $month, $year ) =
    $from_date_str =~ /^([0-9]{2})([0-9]{2})([0-9]{4})\z/
    or die "Invalid Date $from_date_str";

  #print "$day, $month, $year\n";

  my $from_date = DateTime->new(
    day       => $day,
    month     => $month,
    year      => $year,
    time_zone => 'local'
  );

  my $today     = DateTime->today;
  my $yesterday = $today->subtract( days => 1 );

  # Loop Dates
  while ( $from_date < $yesterday ) {
    my $d = $from_date->dmy("");
    push( @fetch_date, $d );
    $from_date->add( days => 1 );
  }

  return @fetch_date;
}

my $k_date     = "24052013";
my @fetch_date = get_all_dates_since($k_date);
foreach my $d (@fetch_date) {
  print $d, "\n";
}
