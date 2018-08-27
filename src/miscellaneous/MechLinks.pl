

    my @arrayLinks = $mech->find_all_links(text_regex => qr/SJVNR/is);
    foreach my $mechLink (@arrayLinks)
    {
        print $mechLink->url_abs,"\n";
        $response = $mech->get($mechLink->url_abs);
        get_response_content();

        get_equity_xns();        
    }
