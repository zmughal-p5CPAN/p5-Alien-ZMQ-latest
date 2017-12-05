package Alien::ZMQ::latest;
# ABSTRACT: Alien package for the ZeroMQ library

use strict;
use warnings;

use base qw( Alien::Base );
use Role::Tiny::With qw( with );

with 'Alien::Role::Dino';

1;
__END__
=head1 DESCRIPTION

Installs the latest release of ZeroMQ.

=head1 SEE ALSO

L<ZeroMQ|http://zeromq.org/>
