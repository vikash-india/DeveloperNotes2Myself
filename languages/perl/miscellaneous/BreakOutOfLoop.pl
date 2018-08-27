#######################################################################################################
# Description: break out of loop
# Notes: 
#       1. The Perl keyword last breaks the loop and causes control to be thrown to the first statement following the loop
#       2.  
#######################################################################################################

for (my $counter=0; $counter<5; $counter++)
{
    if ($counter == 3)
    {
        last;              # Breaks out of the loop. Label can also be given
        #next;              # Continue. Label can also be given
        #redo;               
    }
    print "$counter\n";
}
