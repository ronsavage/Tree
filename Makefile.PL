use strict;
use warnings;

require 5.006000;

use ExtUtils::MakeMaker;

# ----------------------

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

my(%params) =
(
	($] ge '5.005') ?
	(
		AUTHOR   => 'Rob Kinyin (rkinyon@cpan.org)',
		ABSTRACT => 'Persist multiple trees in a single db table, preserving child order',
	) : (),
	clean =>
	{
		FILES => 'blib/* Makefile MANIFEST Tree-*'
	},
	dist =>
	{
		COMPRESS => 'gzip',
		SUFFIX   => 'gz'
	},
	DISTNAME     => 'Tree',
	NAME         => 'Tree',
	PL_FILES    => {},
	LICENSE      => 'artistic_2',
	PREREQ_PM    =>
	{
		'base'                => 0,
		'constant'            => 0,
		'Data::Dumper'        => 2.136,
		'Exporter'            => 5.66,
		'overload'            => 0,
		'Scalar::Util'        => 1.10,
		'strict'              => 0,
		'Test::Deep'          => 0.088,
		'Test::Exception'     => 0.15,
#		'Test::Pod'           => 1.45, # Make it optional. See t/pod.t
#		'Test::Pod::Coverage' => 1.08, # Make it optional. See t/pod.t
		'Test::More'          => 0.47,
		'Test::Warn'          => 0.08,
		'warnings'            => 0,
	},
	VERSION_FROM => 'lib/Tree.pm',
	INSTALLDIRS => 'site',
	EXE_FILES   => [],
	test        =>
	{
		TESTS => 't/*.t t/Tree_Binary/*.t t/Tree/*.t t/Tree_Fast/*.t',
	},
);

if ( ($ExtUtils::MakeMaker::VERSION =~ /^\d\.\d\d$/) && ($ExtUtils::MakeMaker::VERSION > 6.30) )
{
	$params{LICENSE} = 'artistic_2';
}

if ($ExtUtils::MakeMaker::VERSION ge '6.46')
{
	$params{META_MERGE} =
	{
		'meta-spec' =>
		{
			version => 2,
		},
		resources   =>
		{
			bugtracker => 'https://rt.cpan.org/Public/Dist/Display.html?Name=Tree',
			license    => 'http://opensource.org/licenses/Artistic-2.0',
			repository =>
			{
				type => 'git',
				url  => 'https://github.com/ronsavage/Tree.git',
				web  => 'https://github.com/ronsavage/Tree',
			},
		},
	};
}

WriteMakefile(%params);
