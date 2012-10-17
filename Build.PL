use Module::Build;

use 5.6.0;

use warnings;

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

Module::Build -> new
(
	dist_abstract => 'An N-ary tree',
	module_name   => 'Tree',
	license       => 'perl',
	requires      =>
	{
		perl        => '5.6.0',
		Scalar::Util => 1.10,
	},
	configure_requires =>
	{
		Module::Build => 0.40,
	},
	build_requires =>
	{
		base            => 2.16,
		constant        => 1.21,
		Data::Dumper    => 2.136,
		Exporter        => 5.66,
		overload        => 1.13,
		Scalar::Util    => 1.10,
		strict          => 1.04,
		Test::Deep      => 0.088,
		Test::Exception => 0.15,
		Test::More      => 0.47,
		Test::Warn      => 0.08,
		warnings        => 1.12,
	},
	recursive_test_files => 1,
	add_to_cleanup       =>
	[
		'META.yml', '*.bak', '*.gz', 'Makefile.PL',
	],
) -> create_build_script;
