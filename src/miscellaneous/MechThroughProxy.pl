#######################################################################################################
# Description: Program to make Mecahnize go through Burp Proxy or any proxy
# Notes: 
#		1. Keep the Burp or some proxy running and add the following line after initializing Mech 
#			$mech->proxy(['http', 'https'], 'http://localhost:8080/');
#		2. Another way is to use $mech->env_proxy() instead of the above line
#######################################################################################################
 
use strict;
use WWW::Mechanize;
use IO::Handle;														# autoflush
use Log::Log4perl qw(:easy);										# log4perl-easy1.pl

autoflush STDOUT 1;
Log::Log4perl->easy_init( $INFO);									# DEBUG, INFO, WARN, ERROR, FATAL 

my $url	= "http://www.businessquiz.com";

my $mech = WWW::Mechanize->new();									# Initialize Mechanize
$mech->proxy(['http', 'https'], 'http://localhost:8080/');			# Make Mechanize go through proxy										


INFO("INFO: Getting the URL".$url);
$mech->get($url);

my $c = $mech->content;

INFO("INFO: The Contents of current page\n".$c);
