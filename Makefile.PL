use strict;
use warnings;

require 5.006000;

use ExtUtils::MakeMaker;

# ----------------------

eval "use Tree::Binary;";

if (! $@)
{
	if ( (my $version = Tree::Binary->VERSION) <= 0.07 )
	{
		my $tree_binary_msg = "You currently have Tree::Binary version $version installed.\nThis distribution will install an incompatible Tree::Binary module on top of it.\nDo you wish for me to continue?";

		if (! Module::Build->y_n( $tree_binary_msg, 'n' ) )
		{
			exit;
		}
	}
}

WriteMakefile
(
	($] ge '5.005') ?
	(
		AUTHOR   => 'Rob Kinyin (rkinyon@cpan.org)',
		ABSTRACT => 'Persist multiple trees in a single db table, preserving child order',
	) : (),
	NAME         => 'Tree',
	VERSION_FROM => 'lib/Tree.pm',
	PREREQ_PM    =>
	{
		'Scalar::Util'    => '1.10',
		'Test::Deep'      => '0.088',
		'Test::Exception' => '0.15',
		'Test::More'      => '0.47',
		'Test::Warn'      => '0.08',
	},
	INSTALLDIRS => 'site',
	EXE_FILES   => [],
	PL_FILES    => {},
	test        =>
	{
		TESTS => 't/*.t t/Tree_Binary/*.t t/Tree/*.t t/Tree_Fast/*.t',
	},
);
