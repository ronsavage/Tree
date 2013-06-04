use Module::Build;

use 5.6.0;

use warnings;


Module::Build -> new
(
	dist_abstract => 'An N-ary tree',
	module_name   => 'Tree',
	license       => 'artistic_2',
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
		base                => 0,
		constant            => 0,
		Data::Dumper        => 2.136,
		Exporter            => 5.66,
		overload            => 0,
		Scalar::Util        => 1.10,
		strict              => 0,
		Test::Deep          => 0.088,
		Test::Exception     => 0.15,
#		Test::Pod           => 1.45, # Make it optional. See t/pod.t
#		Test::Pod::Coverage => 1.08, # Make it optional. See t/pod.t
		Test::More          => 0.47,
		Test::Warn          => 0.08,
		warnings            => 0,
	},
	recursive_test_files => 1,
	add_to_cleanup       =>
	[
		'META.yml', '*.bak', '*.gz', 'Makefile.PL',
	],
) -> create_build_script;
