#-----------------------------------------------------Test code Begins
sub test
{
    debug_print("Running Test Code");

    #my $uri = "output5.html";
    #my $uri = "D:\\Perfios\\InstitutionSupport\\Kotak\\PMS\\Summary_01.html";
    #my $uri = "D:\\Perfios\\InstitutionSupport\\Kotak\\PMS\\Summary_02.html";
    #my $uri = "D:\\Perfios\\InstitutionSupport\\Kotak\\PMS\\Summary_03.html";
    #my $uri = "D:\\Perfios\\InstitutionSupport\\Kotak\\PMS\\Summary_04.html";
    #my $uri = "D:\\Perfios\\InstitutionSupport\\Kotak\\PMS\\Summary_04.html";
    my $uri = "http://www.businessquiz.com/bq/business/biz.html";
    
    if ( -e $uri )
    {
        require URI::file;
        $uri = URI::file->new_abs($uri)->as_string;
    }

    # Simulate a HTTP hit on the local file
    $response = $mech->get($uri);
    get_response_content();
    
    #print "$c\n";
    #get_xns();
    
    debug_print("End of Test Code");
    exit(0);
}

#-----------------------------------------------------Test Code Ends
test();