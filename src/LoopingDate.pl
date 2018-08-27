use strict;
use warnings;
use DateTime;

my $start = DateTime->new(
    day   => 1,
    month => 1,
    year  => 2000,
);

my $stop = DateTime->new(
    day   => 10,
    month => 1,
    year  => 2000,
);


while ( $start->add(days => 1) < $stop ) {
    printf "Date: %s\n", $start->ymd('-');
}