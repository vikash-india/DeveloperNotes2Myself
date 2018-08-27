#################################################################################
# Description	: Script to fetch Face Value from BSE or NSE for various tickers.
# Arguments		: None
# Input			: A file with name ticker.txt should exist in the same folder.
# 				  This file contains tab separated list of ticker_id, NSE Symbol 
# 				  and BSE Scrip Code from k_equity_ticker table.
# Output		: An updated script facevalue.sql is created.
# Note			: Script takes approximated 50 minutes to fetch 6500 records.
# Known Issues	: Mechanize crashes if there is an error in fetching a file. In
#				  such a case the script needs to be restarted after setting the
#				  variable $startTickerId to next ticker_id to be fetched.
#################################################################################
use WWW::Mechanize;
use LWP::ConnCache;
use Encode;
use strict;

# Initialize Mechanize
my $mech = WWW::Mechanize->new();
$mech->env_proxy();
$mech->conn_cache( LWP::ConnCache->new() );
$mech->add_header(
    'User-Agent'      => 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)',
    'Accept'          => '*/*',
    'Accept-Language' => 'en-US',
);

my $c;
my $response;
my $k_debug 		 	= 0;
my $count 			 	= 0;
my $baseURL 	 		= "http://en.wikipedia.org/wiki/";
my $page				= "Rehnaa_Hai_Terre_Dil_Mein";
my $outputFile			= "output.txt";

my $retryCounter = 0;
sub debug_print {
    my $message = shift;
    if ($k_debug) {
        print "KFetcher: $message\n";
    }
}

sub error_exit {
    my $err_type = shift;
    my $message  = shift;
    print "#ERROR $err_type $message\n";
    if ( $err_type ne "IO" && $k_debug == 0 && defined $c ) {
        dump_file( $c, "err" );
    }
    print "Inside Error Exit\n";
    sleep(2);
    #exit(1);
}

sub dump_file {
    my ($local_c, $prefix) = @_;

    my $filename = $prefix . $count . ".html";
    open( OUTFILE, ">$filename" ) or error_exit( "IO", "Can't open $filename: $!" );
    binmode(OUTFILE);
    $local_c = decode_utf8($local_c);
    print OUTFILE $local_c;
    close OUTFILE;
    debug_print("Response dumped in file $filename");
}

sub get_response_content {
    $count += 1;
    $c = $response->decoded_content();
    if ($k_debug) {
        my $ct            = $mech->ct;
        my $k_status_line = $response->status_line;
        my $k_url_base    = $response->base;
        debug_print("Status Line: $k_status_line");
        debug_print("Content Type: $ct");
        debug_print("Base: $k_url_base");
        if ( $response->is_info ) {
            debug_print("is_info: yes");
        } else {
            debug_print("is_info: no");
        }
        if ( $response->is_success ) {
            debug_print("is_success: yes");
        } else {
            debug_print("is_success: no");
        }
        if ( $response->is_redirect ) {
            debug_print("is_redirect: yes");
        } else {
            debug_print("is_redirect: no");
        }
        if ( $response->is_error ) {
            debug_print("is_error: yes");
        } else {
            debug_print("is_error: no");
        }
        my $k_cookies = $mech->cookie_jar->as_string;
        debug_print($k_cookies);
        dump_file( $c, "output" );
    }
    if ( $response->is_error ) {
        if ($retryCounter < 3) {
        	print "Reloading Mechanize\n";
            $mech->reload();
            get_response_content();
        }
        $retryCounter++;
        error_exit( "HTTP", "Unable to fetch url#$count. Status: " . $response->status_line );
    }
}

# Start of Main
open(OUT, ">$outputFile");	# Output

my $url = "$baseURL$page";
print "Fetching file from $url\n";
debug_print( "Fetching file from $url");
$response = $mech->get($url);
get_response_content();

if ($c =~ m/summary(.*)scope>/igs) 
{
	print $1;
}

close(OUT);

print "Finished Execution Successfully";
exit 0;
