#!/usr/bin/env perl

use Test2::V0;
use Test::Alien;
use Alien::ZMQ::latest;

plan tests => 1;

subtest "ZeroMQ version" => sub {
	alien_ok 'Alien::ZMQ::latest';

	my $xs = do { local $/; <DATA> };
	xs_ok $xs, with_subtest {
		my($module) = @_;
		is $module->version, Alien::ZMQ::latest->version,
			"Got zmq version @{[ Alien::ZMQ::latest->version ]}";
	};
};

done_testing;
__DATA__
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "zmq.h"

char *
version(const char *class)
{
	/* 256 should be long enough */
	char* version_string = malloc(256);

	int major, minor, patch;
	zmq_version(&major, &minor, &patch);

	sprintf(version_string, "%d.%d.%d", major, minor, patch);

	return version_string;
}

MODULE = TA_MODULE PACKAGE = TA_MODULE

const char *version(class);
	const char *class;
