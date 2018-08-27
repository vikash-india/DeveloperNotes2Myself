#######################################################################################################
# Description: Program to use LOG module
# Notes: 
#		1.  This package can be explored more
#######################################################################################################
 
use strict;
use Log::Log4perl qw(:easy);										# log4perl-easy1.pl

Log::Log4perl->easy_init( $DEBUG);									# DEBUG, INFO, WARN, ERROR, FATAL 

ERROR("ERROR: This is Error");
INFO("INFO: This is Info");
DEBUG("INFO: This is Debug");
 