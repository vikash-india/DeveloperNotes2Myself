use WWW::Mechanize;
use LWP::ConnCache;
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
my $k_debug = 1;
my $count = 0;


my $base_URL     = "http://www.bseindia.com/bseplus/StockReach/AdvanceStockReach.aspx?scripcd=521046";


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
    sleep(2);
    exit(1);
}

sub dump_file {
    my ($local_c, $prefix) = @_;

    my $filename = $prefix . $count . ".html";
    open( OUTFILE, ">$filename" ) or error_exit( "IO", "Can't open $filename: $!" );
    binmode(OUTFILE);
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
    if ( $count >= 70 ) {
        error_exit( "PAGE", "Too many URL calls (may be looping). Goodbye!" );
    }
    if ( $response->is_error ) {
        error_exit( "HTTP", "Unable to fetch url#$count. Status: " . $response->status_line );
    }
}

# Start of Main
debug_print( "Getting the URL: " . $base_URL);
$response = $mech->get($base_URL);
get_response_content();

my $test_url = "http://www.bseindia.com/bseplus/StockReach/AdvStockReach.aspx?scripcode=521046&section=tab1&IsPF=undefined&random=0.5614909508422";
debug_print( "Getting the Test URL: " . $test_url);
$response = $mech->get($test_url);
get_response_content();
