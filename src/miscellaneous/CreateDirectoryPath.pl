#!/usr/bin/perl
use File::Path;


mkdir ("C:\\temp\\vikash\\vikash\\vikash", 0777);	# Only for 1 Directory
mkpath('C:/temp/vikash/vikash/vikash', 1, 0711);
 
open TEST, ">C:\\temp\\vikash\\vikash\\vikash\\vikash.txt";
close TEST;

