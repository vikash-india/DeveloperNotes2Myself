#!/usr/bin/perl -w
###########################################################################################################################
# Description: Discover script for American Express (Amex) Credit Card
# Arguments: 
#       - k_username
#       - k_password
#       - k_debug
# Known Issue: 
#       1. None
# Notes: 
#       1. The Output of this file is of the pattern 
#           1, cc,12321432143
#           2, cc,1234343423
#           3, cc,...
###########################################################################################################################
use strict;
use WWW::Mechanize;
use LWP::ConnCache;
use IO::Handle;

autoflush STDOUT 1;

# Get parameter values
#PARAMS#

# For standalone testing, uncomment and change the next few lines
my $k_username  = 'ramgsam';
my $k_password  = '2007G4u';
my $k_debug     = 1;

# Other datastructure
my $base_URL    = "https://www99.americanexpress.com";            # Base URL for application login
my $CC          = "cc";
my $accounts    = 1;                                               # Count of No. of accounts which were discovered
my $no_logout   = 1;
my $count       = 0;
my $c;
my $response;
my $form_name;

# Initialize Mechanize
my $mech = WWW::Mechanize->new();
$mech->env_proxy();
#$mech->proxy(['http', 'https'], 'http://localhost:8080/');          # Make Mechanize go through proxy   
$mech->conn_cache( LWP::ConnCache->new() );
$mech->add_header(
    'User-Agent'      => 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)',
    'Accept'          => '*/*',
    'Accept-Language' => 'en-US',
);

sub debug_print 
{
    my $message = shift;
    if ($k_debug)
    {
        print "KFetcher: $message\n";
    }
}

sub error_exit 
{
    my $err_type = shift;
    my $message  = shift;
    print "#ERROR $err_type $message\n";
    if ($err_type ne "IO" && $err_type ne "PASSWORD" && $k_debug == 0 && defined $c) 
    {
        dump_file($c, "err");
    }
    do_logout();
    sleep(2);
    exit(1);
}

sub dump_file 
{
    my $local_c = shift;
    my $prefix = shift;
    my $filename = $prefix . $count . ".html";
    open(OUTFILE, ">$filename") or error_exit("IO", "Can't open $filename: $!");
    binmode(OUTFILE);
    print OUTFILE $local_c;
    close OUTFILE;
    debug_print("Response dumped in file $filename");
}


sub get_response_content
{
    $count += 1;
    $c = $response->decoded_content();
    if ($k_debug)
    {
        my $ct            = $mech->ct;
        my $k_status_line = $response->status_line;
        my $k_url_base    = $response->base;
        debug_print("Status Line: $k_status_line");
        debug_print("Content Type: $ct");
        debug_print("Base: $k_url_base");
        if ( $response->is_info )
        {
            debug_print("is_info: yes");
        }
        else
        {
            debug_print("is_info: no");
        }
        if ( $response->is_success )
        {
            debug_print("is_success: yes");
        }
        else
        {
            debug_print("is_success: no");
        }
        if ( $response->is_redirect )
        {
            debug_print("is_redirect: yes");
        }
        else
        {
            debug_print("is_redirect: no");
        }
        if ( $response->is_error )
        {
            debug_print("is_error: yes");
        }
        else
        {
            debug_print("is_error: no");
        }

        my $k_cookies = $mech->cookie_jar->as_string;
        debug_print($k_cookies);
        dump_file($c, "output");
    }
    if ($count == 70)
    {
        error_exit("PAGE", "Too many URL calls (may be looping). Goodbye!");
    }
    if ( $response->is_error )
    {
        error_exit("HTTP", "Unable to fetch url#$count. Status: " . $response->status_line);
    }
    if ( $c =~ /A\s+security\s+time-out\s+has\s+just\s+occurred/is)
    {
        # do not attempt logout
        $no_logout = 1;
        error_exit( "TIMEOUT", "Session Expired" );
    }
    if ( $c =~ /We\'re\s+Sorry/is)
    {
        # do not attempt logout
        #$no_logout = 1;
        error_exit( "SITE", "Site did not respond properly" );
    }
}

sub strip_html
{
    my $n = shift;

    # Strip basic HTML
    $n =~ s/\&nbsp;//g;
    
    #Replace commonly used HTML special characters (&amp; with &)
    $n =~ s/&amp;/&/g;
    $n =~ s/&lt;/</g;
    $n =~ s/&gt;/>/g;
    
    return $n;
}

sub comma_space_free
{
    my $n = shift;
    $n =~ s/(,|\s)//g;
    $n = strip_html($n);
    return $n;
}

sub escape_comma
{
    my $n = shift;
    # Remove excess whitespace
    $n =~ s/\s+/ /g;
    # Replace &nbsp; by space
    $n =~ s/\&nbsp;/ /g;
    # Remove leading and trailing whitespaces
    if ($n =~ /^\s*(.*?)\s*$/s)
    {
      $n = $1;
    }
    
    #Replace commonly used HTML special characters (&amp; with &)
    $n =~ s/&amp;/&/g;
    $n =~ s/&lt;/</g;
    $n =~ s/&gt;/>/g;
    
    # Escape comma
    $n =~ s/\\/\\\\/g;
    $n =~ s/,/\\,/g;
    return $n;
}

sub do_logout 
{
    if ($no_logout)
    {
        return; 
    }

   $response = $mech->get("https://www99.americanexpress.com/myca/logon/japa/action?request_type=LogLogoffHandler&Face=en_IN");
   get_response_content();   
   # Vikash: Check regex before proceeding
   $response = $mech->get("https://www24.americanexpress.com/india/myaccount/logoff.asp");
   get_response_content();   
       
    if ( $c =~ /You\s+have\s+now\s+left\s+the\s+secure\s+areas\s+of\s+American\s+Express\s+Online\s+Services/i )
    {
        debug_print("Logged out successfully");
    }
}

sub discoverAccounts
{
    print "#BeginResult\n";
    if ( $c =~ /All\s+Cards(.*?)<\/SELECT>/is)
    {
        my $t = $1;
        my @creditCards = $t =~ m{<OPTION.*?>(.*?)</OPTION>}gis;          #Regex: Array of data b/w <option> to </option>
        
        # Find the Saving Bank Accounts   
        foreach my $creditCard (@creditCards)
        {
            $creditCard =~ m/^(.*?)(&nbsp;.*)$/is;
            my $cardHolderName = $1;
            my $cardPattern = comma_space_free(strip_html($2));
            #print $accounts++.",$CC,$cardPattern,$cardHolderName\n";
            print $accounts++.",$CC,$cardPattern\n";
        }
    }
    else
    {
        debug_print("Unable to parse the Account Discovery HTML");        
    }
    print "#EndResult\n";
}

#-----------------------------------------------------Test code Begins
sub test
{
    debug_print("Running Test Code");

    #my $uri = "output5.html";
    my $uri = "D:\\Perfios\\InstitutionSupport\\AmericanExpress\\Credit\ Cards\\Screen_002_HTTP2.html";
    
    if ( -e $uri )
    {
        require URI::file;
        $uri = URI::file->new_abs($uri)->as_string;
    }

    # Simulate a HTTP hit on the local file
    $response = $mech->get($uri);
    get_response_content();
    my $formTemp = $mech->form_number(1);
    my @inputObjects = $mech->find_all_inputs();
    my @hiddenInput;
    foreach my $inputObj (@inputObjects)
    {
        if ($inputObj->type eq "hidden")
        {
            print "Data: ",$inputObj->name,"=>",$inputObj->value,"\n";
        }
    }


#    print $mech->value("Hidden", 1),"\n";
#    print $mech->value("Hidden", 82),"\n";
#print "Value: ",    $mech->value("Hidden",1)    ,"\n";
#print "Value: ",    $mech->value("Hidden",2)    ,"\n";
#print "Value: ",    $mech->value("Hidden",3)    ,"\n";
#print "Value: ",    $mech->value("Hidden",4)    ,"\n";
#print "Value: ",    $mech->value("Hidden",5)    ,"\n";
#print "Value: ",    $mech->value("Hidden",6)    ,"\n";
#print "Value: ",    $mech->value("Hidden",7)    ,"\n";
#print "Value: ",    $mech->value("Hidden",8)    ,"\n";
#print "Value: ",    $mech->value("Hidden",9)    ,"\n";
#print "Value: ",    $mech->value("Hidden",10)   ,"\n";
#print "Value: ",    $mech->value("Hidden",11)   ,"\n";
#print "Value: ",    $mech->value("Hidden",12)   ,"\n";
#print "Value: ",    $mech->value("Hidden",13)   ,"\n";
#print "Value: ",    $mech->value("Hidden",14)   ,"\n";
#print "Value: ",    $mech->value("Hidden",15)   ,"\n";
#print "Value: ",    $mech->value("Hidden",16)   ,"\n";
#print "Value: ",    $mech->value("Hidden",17)   ,"\n";
#print "Value: ",    $mech->value("Hidden",18)   ,"\n";
#print "Value: ",    $mech->value("Hidden",19)   ,"\n";
#print "Value: ",    $mech->value("Hidden",20)   ,"\n";
#print "Value: ",    $mech->value("Hidden",21)   ,"\n";
#print "Value: ",    $mech->value("Hidden",22)   ,"\n";
#print "Value: ",    $mech->value("Hidden",23)   ,"\n";
#print "Value: ",    $mech->value("Hidden",24)   ,"\n";
#print "Value: ",    $mech->value("Hidden",25)   ,"\n";
#print "Value: ",    $mech->value("Hidden",26)   ,"\n";
#print "Value: ",    $mech->value("Hidden",27)   ,"\n";
#print "Value: ",    $mech->value("Hidden",28)   ,"\n";
#print "Value: ",    $mech->value("Hidden",29)   ,"\n";
#print "Value: ",    $mech->value("Hidden",30)   ,"\n";
#print "Value: ",    $mech->value("Hidden",31)   ,"\n";
#print "Value: ",    $mech->value("Hidden",32)   ,"\n";
#print "Value: ",    $mech->value("Hidden",33)   ,"\n";
#print "Value: ",    $mech->value("Hidden",34)   ,"\n";
#print "Value: ",    $mech->value("Hidden",35)   ,"\n";
#print "Value: ",    $mech->value("Hidden",36)   ,"\n";
#print "Value: ",    $mech->value("Hidden",37)   ,"\n";
#print "Value: ",    $mech->value("Hidden",38)   ,"\n";
#print "Value: ",    $mech->value("Hidden",39)   ,"\n";
#print "Value: ",    $mech->value("Hidden",40)   ,"\n";
#print "Value: ",    $mech->value("Hidden",41)   ,"\n";
#print "Value: ",    $mech->value("Hidden",42)   ,"\n";
#print "Value: ",    $mech->value("Hidden",43)   ,"\n";
#print "Value: ",    $mech->value("Hidden",44)   ,"\n";
#print "Value: ",    $mech->value("Hidden",45)   ,"\n";
#print "Value: ",    $mech->value("Hidden",46)   ,"\n";
#print "Value: ",    $mech->value("Hidden",47)   ,"\n";
#print "Value: ",    $mech->value("Hidden",48)   ,"\n";
#print "Value: ",    $mech->value("Hidden",49)   ,"\n";
#print "Value: ",    $mech->value("Hidden",50)   ,"\n";
#print "Value: ",    $mech->value("Hidden",51)   ,"\n";
#print "Value: ",    $mech->value("Hidden",52)   ,"\n";
#print "Value: ",    $mech->value("Hidden",53)   ,"\n";
#print "Value: ",    $mech->value("Hidden",54)   ,"\n";
#print "Value: ",    $mech->value("Hidden",55)   ,"\n";
#print "Value: ",    $mech->value("Hidden",56)   ,"\n";
#print "Value: ",    $mech->value("Hidden",57)   ,"\n";
#print "Value: ",    $mech->value("Hidden",58)   ,"\n";
#print "Value: ",    $mech->value("Hidden",59)   ,"\n";
#print "Value: ",    $mech->value("Hidden",60)   ,"\n";
#print "Value: ",    $mech->value("Hidden",61)   ,"\n";
#print "Value: ",    $mech->value("Hidden",62)   ,"\n";
#print "Value: ",    $mech->value("Hidden",63)   ,"\n";
#print "Value: ",    $mech->value("Hidden",64)   ,"\n";
#print "Value: ",    $mech->value("Hidden",65)   ,"\n";
#print "Value: ",    $mech->value("Hidden",66)   ,"\n";
#print "Value: ",    $mech->value("Hidden",67)   ,"\n";
#print "Value: ",    $mech->value("Hidden",68)   ,"\n";
#print "Value: ",    $mech->value("Hidden",69)   ,"\n";
#print "Value: ",    $mech->value("Hidden",70)   ,"\n";
#print "Value: ",    $mech->value("Hidden",71)   ,"\n";
#print "Value: ",    $mech->value("Hidden",72)   ,"\n";
#print "Value: ",    $mech->value("Hidden",73)   ,"\n";
#print "Value: ",    $mech->value("Hidden",74)   ,"\n";
#print "Value: ",    $mech->value("Hidden",75)   ,"\n";
#print "Value: ",    $mech->value("Hidden",76)   ,"\n";
#print "Value: ",    $mech->value("Hidden",77)   ,"\n";
#print "Value: ",    $mech->value("Hidden",78)   ,"\n";
#print "Value: ",    $mech->value("Hidden",79)   ,"\n";
#print "Value: ",    $mech->value("Hidden",80)   ,"\n";
#print "Value: ",    $mech->value("Hidden",81)   ,"\n";
#print "Value: ",    $mech->value("Hidden",82)   ,"\n";
#print "Value: 83",    $mech->value("Hidden",83)   ,"\n";
    #print "$c\n";
    #discoverAccounts();
    
    debug_print("End of Test Code");
    exit(0);
}
#-----------------------------------------------------Test Code Ends
test();

if ( !defined $k_username or !defined $k_password or $k_username eq '' or $k_password eq '' )
{
    error_exit( "PASSWORD", "Empty credentials provided for login" );
    exit(0);
}

# Step 1: Hit the Amex Login page
# -------------------------------
my $url = "http://www.americanexpress.com/india/homepage.shtml";
debug_print( "Fetching the Login page for Amex");
$response = $mech->get($url);
get_response_content();

# Step 2: Login now
# -----------------
debug_print("Logging in to application.");
$form_name = "ssoform";
if ( defined $mech->form_name($form_name) )
{
    $response = $mech->submit_form(
    fields    => {
        TARGET    => $mech->value('DestPage'),
        UserID    => $k_username,
        Password  => $k_password,
        USERID    => $k_username,       # Amex Javascript code addition
        PWD       => $k_password,       # Amex Javascript code addition
        manage    => "option1",
        },
    );
    get_response_content();
}
else
{
    error_exit( "PAGE", "Form $form_name not found" );
}

# Validate Password Credential Page
if ( $c =~ /User\s+ID\s+or\s+Password\s+is\s+Incorrect/is )
{
    error_exit( "PASSWORD", "Credentials mis-match. Please try again" );
}
$no_logout = 0;

#Validate Correct Home Page
if ( $c =~ /Choose\s+an\s+Account/is )
{
    debug_print("Login successful");
}
else
{
    error_exit( "PAGE", "Landed on the wrong page after login." );
}


#Step 3: Click on Other Periods Button
#-------------------------------------
$mech->add_header(Referer => 'https://www99.americanexpress.com/myca/estatement/japa/action?request_type=authreg_CardsList&Face=en_IN&india_nav=TEXTLINK_PersCards_Login');
my $k_sform = $mech->form_number(1);
my $k_sform_action = $k_sform->action;
$response = $mech->post($k_sform_action,
            [
                request_type     => "authreg_CardsListDest",
                INPUTTYPE        => "BUTTON",
                other_periods    => "Other Periods",
                sorted_index     => 0,                  #Vikash: Sorted Index needs to be done for each of the strings
                Hidden           => $mech->value("Hidden",1)    ,
                Hidden           => $mech->value("Hidden",2)    ,
                Hidden           => $mech->value("Hidden",3)    ,
                Hidden           => $mech->value("Hidden",4)    ,
                Hidden           => $mech->value("Hidden",5)    ,
                Hidden           => $mech->value("Hidden",6)    ,
                Hidden           => $mech->value("Hidden",7)    ,
                Hidden           => $mech->value("Hidden",8)    ,
                Hidden           => $mech->value("Hidden",9)    ,
                Hidden           => $mech->value("Hidden",10)   ,
                Hidden           => $mech->value("Hidden",11)   ,
                Hidden           => $mech->value("Hidden",12)   ,
                Hidden           => $mech->value("Hidden",13)   ,
                Hidden           => $mech->value("Hidden",14)   ,
                Hidden           => $mech->value("Hidden",15)   ,
                Hidden           => $mech->value("Hidden",16)   ,
                Hidden           => $mech->value("Hidden",17)   ,
                Hidden           => $mech->value("Hidden",18)   ,
                Hidden           => $mech->value("Hidden",19)   ,
                Hidden           => $mech->value("Hidden",20)   ,
                Hidden           => $mech->value("Hidden",21)   ,
                Hidden           => $mech->value("Hidden",22)   ,
                Hidden           => $mech->value("Hidden",23)   ,
                Hidden           => $mech->value("Hidden",24)   ,
                Hidden           => $mech->value("Hidden",25)   ,
                Hidden           => $mech->value("Hidden",26)   ,
                Hidden           => $mech->value("Hidden",27)   ,
                Hidden           => $mech->value("Hidden",28)   ,
                Hidden           => $mech->value("Hidden",29)   ,
                Hidden           => $mech->value("Hidden",30)   ,
                Hidden           => $mech->value("Hidden",31)   ,
                Hidden           => $mech->value("Hidden",32)   ,
                Hidden           => $mech->value("Hidden",33)   ,
                Hidden           => $mech->value("Hidden",34)   ,
                Hidden           => $mech->value("Hidden",35)   ,
                Hidden           => $mech->value("Hidden",36)   ,
                Hidden           => $mech->value("Hidden",37)   ,
                Hidden           => $mech->value("Hidden",38)   ,
                Hidden           => $mech->value("Hidden",39)   ,
                Hidden           => $mech->value("Hidden",40)   ,
                Hidden           => $mech->value("Hidden",41)   ,
                Hidden           => $mech->value("Hidden",42)   ,
                Hidden           => $mech->value("Hidden",43)   ,
                Hidden           => $mech->value("Hidden",44)   ,
                Hidden           => $mech->value("Hidden",45)   ,
                Hidden           => $mech->value("Hidden",46)   ,
                Hidden           => $mech->value("Hidden",47)   ,
                Hidden           => $mech->value("Hidden",48)   ,
                Hidden           => $mech->value("Hidden",49)   ,
                Hidden           => $mech->value("Hidden",50)   ,
                Hidden           => $mech->value("Hidden",51)   ,
                Hidden           => $mech->value("Hidden",52)   ,
                Hidden           => $mech->value("Hidden",53)   ,
                Hidden           => $mech->value("Hidden",54)   ,
                Hidden           => $mech->value("Hidden",55)   ,
                Hidden           => $mech->value("Hidden",56)   ,
                Hidden           => $mech->value("Hidden",57)   ,
                Hidden           => $mech->value("Hidden",58)   ,
                Hidden           => $mech->value("Hidden",59)   ,
                Hidden           => $mech->value("Hidden",60)   ,
                Hidden           => $mech->value("Hidden",61)   ,
                Hidden           => $mech->value("Hidden",62)   ,
                Hidden           => $mech->value("Hidden",63)   ,
                Hidden           => $mech->value("Hidden",64)   ,
                Hidden           => $mech->value("Hidden",65)   ,
                Hidden           => $mech->value("Hidden",66)   ,
                Hidden           => $mech->value("Hidden",67)   ,
                Hidden           => $mech->value("Hidden",68)   ,
                Hidden           => $mech->value("Hidden",69)   ,
                Hidden           => $mech->value("Hidden",70)   ,
                Hidden           => $mech->value("Hidden",71)   ,
                Hidden           => $mech->value("Hidden",72)   ,
                Hidden           => $mech->value("Hidden",73)   ,
                Hidden           => $mech->value("Hidden",74)   ,
                Hidden           => $mech->value("Hidden",75)   ,
                Hidden           => $mech->value("Hidden",76)   ,
                Hidden           => $mech->value("Hidden",77)   ,
                Hidden           => $mech->value("Hidden",78)   ,
                Hidden           => $mech->value("Hidden",79)   ,
                Hidden           => $mech->value("Hidden",80)   ,
                Hidden           => $mech->value("Hidden",81)   ,
                Hidden           => $mech->value("Hidden",82)   ,
            ]
);
get_response_content();

# Step 4: Select all Credit Cards 
# -------------------------------
discoverAccounts();

# Step 6: logout
# --------------
do_logout();
exit(0);
