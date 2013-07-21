use strict;

# Open the file and read the content in a single variable
my $inputFile	= "fix_protocol.html";
local $/=undef;
open(IN, "$inputFile") || die "Error open: $!";	
my $data = <IN>;
close(IN);

# For Writing to Output File
my $outputFile = "SQL_FILE.sql";
open(OUT, ">$outputFile") || die "Error open: $!";

# Scrape the content of the page
if ($data =~ m/Expand Components(.*)Menu/igs) {
	$data = $1;
	
	$data =~ m/Collapse Components(.*)/igs;
	$data = $1;
	
    my @rows = $data =~ /<a.*?>(.*?)<\/a/gis;
    my $i = 0;
    my $colOne = "";
    my $colTwo = "";
    foreach my $row (@rows) {
    	if ($row =~ m/^<.*/gis) {
			# Nothing    		
    	} else {
    		if ($i == 0) {
    			$colOne = $row; 
    			$i = 1;
    		} else {
    			$colTwo = $row;
    			print "$colTwo\t$colOne\n";
    			print OUT "Insert into message_declaration (MESSAGE_DECLARATION_ID,MESSAGE_TYPE_ID,TAG_NAME,DESCRIPTION,START_POSITION,FIELDLENGTH,LAST_UPDATE_USER,LAST_UPDATE_DATE,CREATE_USER,CREATE_DATE,DELETED,VERSION,FIELD_TYPE,AUTO,REQUIRED,META_NAME,PROTOCOL,CONVERTER_CLASS,TIER,CONDITION_NAME,IS_MATCH_KEY,CAN_STORE,DEFAULT_VALUE,PARENT_TAG,IS_BOUNDARY_TAG,DV_GENERATOR_CLASS,FIELD_DATA_TYPE) values (seq_msg_decl.NEXTVAL,1568,'$colOne','$colTwo',0,0,'E18348',SYSDATE,'E18348',SYSDATE,0,'BVMF1.1',x,y,z,'$colTwo','FIX','default-converter',3, 'default-condition',u,v,'TEST_ACCOUNT','20051',1,'default-generator',null)\n";
    			$i = 0;
    		}
    	}
    }
}

close(OUT);   



