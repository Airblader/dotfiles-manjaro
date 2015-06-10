#!/usr/bin/env perl

BEGIN { $| = 1 } # flush \n

use strict;
use warnings;
use Data::Dumper;
use AnyEvent::I3;
use v5.10;

my $i3 = i3();
$i3->connect->recv or die "Error connecting to i3";

sub subscribe {
    my $ev = $_[0];
    my $dump = $_[1];
    if($i3->subscribe({
        $ev => sub {
            my ($msg) = @_;
            say "$ev:$msg->{'change'}";
            if($dump) {
                print Dumper($msg);
            }
        }
    })->recv->{success}) {
        say "Successfully subscribed to $ev-event";
    }
}

my $nextArg = shift;
if(!$nextArg) {
    say "Subscribe to i3-events";
    say "Usage:   $0 workspace|output|mode|window|barconfig_update|binding [dump]";
    say "Example: $0 workspace dump window binding dump";
    exit 1;
}
while($nextArg) {
    my $arg = $nextArg;
    $nextArg = shift;
    my $dump = 0;
    if($nextArg and $nextArg eq "dump") {
        $dump = 1;
        $nextArg = shift;
    }
    subscribe("$arg", $dump);
}
AE::cv->recv;
