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
my $bseSearchURL 	 	= "http://www.bseindia.com/bseplus/StockReach/AdvanceStockReach.aspx?scripcd=";
my $bseQuoteFetchURL	= "http://www.bseindia.com/bseplus/StockReach/AdvStockReach.aspx?scripcode=######&section=tab1&IsPF=undefined&random=0.5614909508422";
my $nseBaseURL     	 	= "http://www.nse-india.com/live_market/dynaContent/live_watch/get_quote/GetQuote.jsp?symbol=";

my $tickerFile			= "ticker.txt";
my $updateScriptFile	= "face_value.sql";
my $startTickerId		= 2;				# This ticker Id is inclusive
my $sqlTemplate			= "update k_equity_ticker set face_value = FACEVALUE where ticker_id = TICKERID;\n";
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
open(IN, "$tickerFile") || die "Error open: $!";	# Ticker File
open(OUT, ">>$updateScriptFile");					# Update script

# Process each line of the ticker file
while (<IN>) 
{
	chomp;
    my $line = $_;
    #print "$_ \n";

	my $tickerId	 	= "";        
	my $bseScripCode	= "";
	my $nseSymbol 		= ""; 
	($tickerId, $nseSymbol, $bseScripCode) = split('\t', $line);
		
	if($tickerId >= $startTickerId) {
		# Current Time Stamp 
		my ($sec, $min, $hr, $day, $mon, $year) = localtime;
		printf("%02d/%02d/%04d %02d:%02d:%02d: ", $day, $mon + 1, 1900 + $year, $hr, $min, $sec);

		print "tickerId=$tickerId, nseSymbol=$nseSymbol, bseScripCode=$bseScripCode\n";
		my $faceValue 		= "";
		my $url  			= "";
	
		# Fetch Face Value from BSE if NSE Symbol Available
		if ($bseScripCode ne '\N') {
			$url = "$bseSearchURL$bseScripCode";
			debug_print( "------------------Fetching from BSE Ticker: $tickerId, BSE Scrip Code: $bseScripCode\t");
			$response = $mech->get($url);
			get_response_content();
				
			$url = $bseQuoteFetchURL;
			$url =~ s/######/$bseScripCode/ig;
			#debug_print( "Getting the Stock Fetch URL: " . $url);
			$response = $mech->get($url);
			get_response_content();
	
			if ($c =~ m/#@#.*?#@#.*?#@#.*?#@#(.*?)#@#/ig) {
				$faceValue = $1;
				$faceValue =~ s/^\s+//;
				$faceValue =~ s/\s+$//;
			}
		}
			
		# Fetch Face Value from BSE if NSE could not fetch it or if NSE Symbol was not available
		if (length($faceValue) == 0 and $nseSymbol ne 'NA') {
			$url = "$nseBaseURL$nseSymbol";
			debug_print( "------------------Fetching from NSE Ticker: $tickerId, NSE Symbol: $nseSymbol\t");
			$response = $mech->get($url);
			get_response_content();
					
			if ($c =~ m/averagePrice.*?faceValue":"(.*?)",/ig) {
				$faceValue = $1;
				$faceValue =~ s/^\s+//;
				$faceValue =~ s/\s+$//;
			}
		}
	
		# Create SQL Statement and write to the output file
		if (length($faceValue) > 0) {
			my $sqlStatement = $sqlTemplate;
			$sqlStatement =~ s/FACEVALUE/$faceValue/ig;
			$sqlStatement =~ s/TICKERID/$tickerId/ig;
			debug_print( "Face Value: $faceValue");
		    print OUT "$sqlStatement";
		} else {
			debug_print( "Invalid Ticker ID: Face Value = NA");
			print OUT "-- Invalid Ticker ID Detected: ticker_id=$tickerId, NSE Symbole=$nseSymbol, BSE Scrip Code=$bseScripCode\n";
		}
		OUT->flush();
	} else {
		# print "Skipping Ticker Id: $tickerId\n";
	}
}

close(OUT);
close(IN);

print "Finished Execution Successfully";
exit 0;
