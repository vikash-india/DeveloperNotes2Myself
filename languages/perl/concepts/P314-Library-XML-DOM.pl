# Description: Using XML::DOM module to parse an XML File
# TODO: Make it work with some other XML library

#use XML::DOM;

my $parser = new XML::DOM::Parser;
my $doc = $parser->parsefile ("P063-XMLDOM-Sample.xml");


if ($doc->getNodeType == DOCUMENT_NODE)
{
       print "It's the root element\n";
}

# print all HREF attributes of all CODEBASE elements

my $nodes = $doc->getElementsByTagName ("");
my $n = $nodes->getLength;


for (my $i = 0; $i < $n; $i++)
{
 my $node = $nodes->item ($i);
 my $href = $node->getAttribute ("HREF");
 print $href->getValue . "\n";
}

$doc->printToFile ("out.xml");
print $doc->toString;
