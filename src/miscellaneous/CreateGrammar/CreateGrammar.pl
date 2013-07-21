##################################################################################################################
# Descrption: Creates XML Grammar from flat file grammar
# 
# Yet to do: 
##################################################################################################################
use Log::Log4perl qw(:easy);                                        # log4perl-easy1.pl

# Modify these variables
my $inputFile               = "Grammar_Test.csv";
my $outputFile              = "Grammar_DSPML.xml";
my $schemeStartCounter      = 1;

# Sample Input Grammar: 1,ID:2145|2146|2147|2148|2149|2150,Fund:fund#DSP Merrill Lynch=dspml|DSP=dsp,
#                       Scheme:schm#Government Securities Fund Plan=gov|GOVERNMENT SECURITIES PLAN=top,IsNumber:true#optional:true,
#                       IsAlpha:true#optional:true,IsPeriod:period#optional:true#6Months=6M|12Months=12M|5Months,IsPlan:true#optional:false,
#                       IsDate:true#optional:false#format:DD/MM/YYYY,IsRiskType:true#optional:true#aggresive=ag|moderate=mod|conservative=cons,
#                       IsOption:true#optional:true,Text:Code#retail1=ret1|retail2=ret2|retail3

# Input File Tags
my $inputTagId              = "ID";
my $inputTagFund            = "Fund";
my $inputTagScheme          = "Scheme";
my $inputTagText            = "Text";

my $inputTagIsPlan          = "IsPlan";
my $inputTagIsOption        = "IsOption";
my $inputTagIsPeriod        = "IsPeriod";
my $inputTagIsRiskType      = "IsRiskType";
my $inputTagIsDate          = "IsDate";
my $inputTagIsAlpha         = "IsAlpha";
my $inputTagIsNumber        = "IsNumber";

# XML Elements and Attributes
#   <MatchConfig>
#   <Rule keyword="fund1">
#       <Patterns>
#           <Pattern name="dsp merrill lynch" keyword="dspml1"/>
#           <Pattern name="dsp" keyword="dsp1"/>
#       </Patterns>
#       <Rule keyword="schm1">
#           <Patterns>
#               <Pattern name="government securities fund plan" keyword="gov1"/>
#               <Pattern name="government securities plan" keyword="top1"/>
#           </Patterns>
#           <Rule isNumber="true" optional="true">
#               <Rule isAlpha="true" optional="true">
#                   <Rule keyword="period2" isPeriod="true" optional="true">
#                       <Patterns>
#                           <Pattern name="6months" keyword="6m2"/>
#                           <Pattern name="12months" keyword="12m2"/>
#                           <Pattern name="5months"/>
#                       </Patterns>
#                       <Rule isPlan="true" optional="false">
#                           <Rule isDate="true" optional="false" format="dd/mm/yyyy">
#                               <Rule keyword="true2" isRiskType="true" optional="true">
#                                   <Patterns>
#                                       <Pattern name="aggresive" keyword="ag2"/>
#                                       <Pattern name="moderate" keyword="mod2"/>
#                                       <Pattern name="conservative" keyword="cons2"/>
#                                   </Patterns>
#                                   <Rule isOption="true" optional="true">
#                                       <Rule keyword="code2">
#                                           <Patterns>
#                                               <Pattern name="retail1" keyword="ret12"/>
#                                               <Pattern name="retail2" keyword="ret22"/>
#                                               <Pattern name="retail3"/>
#                                           </Patterns>
#                                       </Rule>
#                                   </Rule>
#                               </Rule>
#                           </Rule>
#                       </Rule>
#                   </Rule>
#               </Rule>
#           </Rule>
#       </Rule>
#   </Rule>
#   </MatchConfig>

# XML File Tags
my $docElement              = "MatchConfig";

my $elementRule             = "Rule";
my $elementPatterns         = "Patterns";
my $elementPatternsChild    = "Pattern";

my $attributeKeyword        = "keyword";
my $attributeName           = "name";
my $attributeOptional       = "optional";
my $attributePlan           = "isPlan";
my $attributeOption         = "isOption";
my $attributePeriod         = "isPeriod";
my $attributeRiskType       = "isRiskType";
my $attributeAlpha          = "isAlpha";
my $attributeNumber         = "isNumber";
my $attributeDate           = "isDate";
my $attributeFormat         = "format";

# Other data structure
my $xmlNode                 = "";

#Initialize
Log::Log4perl->easy_init($DEBUG);                                               # DEBUG, INFO, WARN, ERROR, FATAL
open(IN, "$inputFile") || die "Error open: $!";  
open(OUT, ">$outputFile"); 

# Write the XML Document Element
print OUT "<$docElement>\n";

# Reading the input grammar file
while (<IN>) 
{
    chomp;
    DEBUG("Grammar Input: $_");
    my $line = lc($_);                                                          # The data should be in lower case
    my @tags = split(/,/, $line);
    DEBUG("Split by Comma:\n", join("\n", @tags),"\n");
    my $ruleTagCount = 0;
    $xmlNode = "";
    #$counter++;
    foreach my $tag (@tags)
    {
        my @tagsValuePair = split(/[:#]/, $tag);
        #DEBUG("Split by Colon or Hash: ", join("\t", @tagsValuePair), "\n");

        # For ID and Serial Number
        if(lc($tagsValuePair[0]) eq lc($inputTagId))
        {
            # Replace pipe(|) with comma(,). 214|123|12 => 214,123,12
            $tagsValuePair[1] =~ s/\|/, /g;
            $xmlNode = $xmlNode."<!-- Grammar $tags[0] for IDs: $tagsValuePair[1] -->\n";
        }

        # For Fund with PATTERN
        if(lc($tagsValuePair[0]) eq lc($inputTagFund))
        {
            CreateNode($tagsValuePair[1], $tagsValuePair[2]);
            $ruleTagCount++;
        }

        # For scheme with PATTERN
        if(lc($tagsValuePair[0]) eq lc($inputTagScheme))
        {
            CreateNode($tagsValuePair[1], $tagsValuePair[2]);
            $schemeStartCounter++;
            $ruleTagCount++;
        }

        # For Text with PATTERN
        if(lc($tagsValuePair[0]) eq lc($inputTagText))
        {
            CreateNode($tagsValuePair[1], $tagsValuePair[2]);
            $ruleTagCount++;
        }

        # For Date
        if(lc($tagsValuePair[0]) eq lc($inputTagIsDate))
        {
            $xmlNode = $xmlNode."<$elementRule $attributeDate=\"$tagsValuePair[1]\" $attributeOptional=\"$tagsValuePair[3]\"  $attributeFormat=\"$tagsValuePair[5]\">\n";
            $ruleTagCount++;
        }

        # For Plan
        if(lc($tagsValuePair[0]) eq lc($inputTagIsPlan))
        {
            $xmlNode = $xmlNode."<$elementRule $attributePlan=\"$tagsValuePair[1]\" $attributeOptional=\"$tagsValuePair[3]\">\n";
            $ruleTagCount++;
        }

        # For Option
        if(lc($tagsValuePair[0]) eq lc($inputTagIsOption))
        {
            $xmlNode = $xmlNode."<$elementRule $attributeOption=\"$tagsValuePair[1]\" $attributeOptional=\"$tagsValuePair[3]\">\n";
            $ruleTagCount++;
        }
        
        # For Period with PATTERN
        if(lc($tagsValuePair[0]) eq lc($inputTagIsPeriod))
        {
            CreateNode($tagsValuePair[1], $tagsValuePair[4], $attributePeriod, $tagsValuePair[3]);
            #$xmlNode = $xmlNode."<$elementRule $attributePeriod=\"$tagsValuePair[1]\" $attributeOptional=\"$tagsValuePair[3]\">\n";
            $ruleTagCount++;
        }

        # For RiskType with PATTERN
        if(lc($tagsValuePair[0]) eq lc($inputTagIsRiskType))
        {
            CreateNode($tagsValuePair[1], $tagsValuePair[4], $attributeRiskType, $tagsValuePair[3]);
            $ruleTagCount++;
        }

        # For Number
        if(lc($tagsValuePair[0]) eq lc($inputTagIsNumber))
        {
            $xmlNode = $xmlNode."<$elementRule $attributeNumber=\"$tagsValuePair[1]\" $attributeOptional=\"$tagsValuePair[3]\">\n";
            $ruleTagCount++;
        }

        # For Alpha
        if(lc($tagsValuePair[0]) eq lc($inputTagIsAlpha))
        {
            $xmlNode = $xmlNode."<$elementRule $attributeAlpha=\"$tagsValuePair[1]\" $attributeOptional=\"$tagsValuePair[3]\">\n";
            $ruleTagCount++;
        }
    }

    # Close All the Rule tag
    for (;$ruleTagCount>0;$ruleTagCount--)
    {
        $xmlNode = $xmlNode."</$elementRule>\n";
    }
    
    #Write the Grammar XML Node to the file
    print OUT $xmlNode;
}

# Write the closing Document Element to the file
print OUT "</$docElement>";

close(IN);
close(OUT);
print "Grammar Creation Complete";

# All the functions and subroutines used in this program
sub CreateNode
{
    my $keyword             = shift;
    my $attributeNameValue  = shift;
    my $attrName            = shift;
    #my $optionalValue = "false";
    my $optionalValue       = shift;
    
    $xmlNode = $xmlNode."<$elementRule";    # Start the tag
    #Check for Base keywordCode
    if ($keyword ne "")    
    {
        $xmlNode = $xmlNode." $attributeKeyword=\"$keyword$schemeStartCounter\"";
    }

    # $xmlNode = $xmlNode."<$elementRule $attributePeriod=\"$tagsValuePair[1]\" $attributeOptional=\"$tagsValuePair[3]\">\n";
    #Check for optional value(true or false)
    if ($attrName ne "")    
    {
        $xmlNode = $xmlNode." $attrName=\"true\" $attributeOptional=\"$optionalValue\"";
    }

    $xmlNode = $xmlNode.">\n";  #End the tag
    
    # Split based on |
    my @patterns = split(/\|/, $attributeNameValue);
    $xmlNode = $xmlNode."<$elementPatterns>";
    foreach $pattern (@patterns)
    {
        # Split based on =
        my @attributes = split(/=/, $pattern);
        
        $xmlNode = $xmlNode."<$elementPatternsChild $attributeName=\"$attributes[0]\"";
        if (defined $attributes[1])
        {
            $xmlNode = $xmlNode." $attributeKeyword=\"$attributes[1]$schemeStartCounter\"";
        }
        $xmlNode = $xmlNode." />";
    }   
    $xmlNode = $xmlNode."</$elementPatterns>\n";
}