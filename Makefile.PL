use warnings;

require 5.006000;

use ExtUtils::MakeMaker;

# ----------------------

WriteMakefile
(
	($] ge '5.005') ?
	(
		AUTHOR   => 'Rob Kinyin (rkinyon@cpan.org)',
		ABSTRACT => 'Persist multiple trees in a single db table, preserving child order',
	) : (),
	NAME         => 'Tree',
	LICENSE   => 'artistic_2',
	VERSION_FROM => 'lib/Tree.pm',
	PREREQ_PM    =>
	{
		base                => 2.16,
		constant            => 1.21,
		Data::Dumper        => 2.136,
		Exporter            => 5.66,
		overload            => 1.13,
		Scalar::Util        => 1.10,
		strict              => 0,
		Test::Deep          => 0.088,
		Test::Exception     => 0.15,
#		Test::Pod           => 1.45, # Make it optional. See t/pod.t
#		Test::Pod::Coverage => 1.08, # Make it optional. See t/pod.t
		Test::More        => 0.47,
		Test::Warn          => 0.08,
		warnings            => 0,
	},
	INSTALLDIRS => 'site',
	EXE_FILES   => [],
	PL_FILES    => {},
	test        =>
	{
		TESTS => 't/*.t t/Tree_Binary/*.t t/Tree/*.t t/Tree_Fast/*.t',
	},
);
