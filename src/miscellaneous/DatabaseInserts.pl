#!/usr/bin/perl-w

use DBI;
use strict;
use Data::Dumper;
my $dbh = DBI->connect("dbi:mysql:karamchand","root","admin") or warn" database not connected";
my ( $input_file, $action_time);
my ($string, $log_id);
my @input_array;
my %user_hash;
my $set_hash = 1;
main();
exit(1);
my $id = 1;

sub main {

    $input_file = "temp.txt";
    open (FH, $input_file) or die " cant open file";
    $string .= $_ while (<FH>);
    @input_array = split('\n', $string);

    foreach my $line (@input_array) {
        my @cols = split(',', $line);
        my $time = convert_date($cols[1]); 
        my $ins_type = $cols[0];
        if ($ins_type eq "LOGIN") {
            my $user_id    = $cols[2];
            my $ip_addr    = $cols[3];
            my $session_id = $cols[4];
            login_details(1, $user_id, $session_id, $ip_addr, $time);
        } elsif ($ins_type eq "LOGOUT") {
            my $session_id = $cols[2];
            login_details(2, $session_id, $time);
        } elsif (($ins_type eq "INFO") || ($ins_type eq "ERROR") )  {
            my $act        = $cols[2];
            my $is_excp    = $cols[3];
            my $session_id = $cols[4];
            my $desc       = $cols[5];
            $desc =~ s/\\/,/g;
            kubera_log($ins_type, $act, $is_excp, $session_id, $time, $desc); 
        } elsif ($ins_type eq "JOB") {
            my $job_id   = $cols[2];
            my $job_type = $cols[3];
            my $user     = $cols[4];
            my $dir      = $cols[5];
            job_trans($job_id, $user, $dir, $job_type, $time);
        } elsif ($ins_type eq "JBERROR") {
            my $act = "FETCHACCTXS";
            my $is_excp = $cols[2];
            my $type = "ERROR";
            my $desc = $cols[3];
            my $session_id = '';
            $desc =~ s/\\/,/g;
            kubera_log($type, $act, $is_excp, $session_id, $time, $desc);
        }
    }
}

sub login_details {
    my $type = shift;
    if ( $type == 1) {
        my ($user_id, $session_id, $ip_addr, $time) = @_;
#       my $sth = $dbh->prepare(q {insert into login_details(user_id,session_id,ip_addr,login_time) values (?,?,?,?) } );
#       $sth->execute($user_id, $session_id, $ip_addr, $time) or die "Couldn't execute statement: " . $sth->errstr;
        my $sth = $dbh->prepare("call login(?,?,?,?)");
        $sth->execute($user_id, $session_id, $ip_addr, $time) or die "Couldn't execute statement: " . $sth->errstr;
    } else {
        my $session_id = shift;
        my $time       = shift;
        my $sth = $dbh->prepare("call logout(?,?)");
        $sth->execute($time, $session_id) or die "Couldn't execute statement: " . $sth->errstr;
    }
}

sub kubera_log {
    my ($ins_type, $act, $is_excp, $session_id, $time, $desc) = @_;
    my $login_id;
    if ($set_hash) {
        my $sql = "SELECT session_id, login_id FROM login_details";
        my $users = $dbh->selectall_hashref( $sql, 1);
        foreach my $user (keys %$users ) {
            $user_hash{$users->{$user}->{'session_id'}} = $users->{$user}->{'login_id'}
        }
        $set_hash = 0;
    }
    $login_id = $user_hash{$session_id};
    my $sth = $dbh->prepare("call insert_kubera(?,?,?,?,?,?)" );
    $sth->execute($ins_type, $act, $is_excp, $time, $login_id, $desc) or die "Couldn't execute statement: " . $sth->errstr;
    if ($act eq "FETCHACCTXS") {
        my @array = $dbh->selectrow_array("SELECT LAST_INSERT_ID() FROM kubera_log");
        $log_id = $array[0];
    }
}

sub job_trans {
    my ($job_id, $user, $dir, $job_type, $time) = @_;
    my $sth = $dbh->prepare("call insert_job(?,?,?,?,?,?)" );
    $sth->execute($job_id, $user, $dir, $job_type, $time, $log_id) or die "Couldn't execute statement: " . $sth->errstr;
}

sub convert_date {
    my $line = shift;
    my @date = split('-', $line);
    $action_time = $date[2]."-".sprintf("%02d",$date[1])."-".sprintf("%02d",$date[0])." ".$date[3];
    return ($action_time);
}

