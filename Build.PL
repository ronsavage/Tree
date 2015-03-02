use strict;
use warnings;

use Module::Build;

use 5.6.0;

# -----------------------------------------------

my $class = Module::Build->subclass(code => <<'EOF');

sub ACTION_authortest
{
	my($self) = @_;

	$self->depends_on('build');
	$self->depends_on('manifest');
	$self->depends_on('distmeta');

	$self->test_files( qw< t xt/author > );
	$self->recursive_test_files(1);

	$self->depends_on('test');

	return;
}
EOF

$class -> new
(
	module_name    => 'Tree',
	license        => 'artistic_2',
	dist_abstract  => 'An N-ary tree',
	dist_author    => 'Ron Savage <ron@savage.net.au>',
	build_requires =>
	{
		'base' => 0,
		'constant' => 0,
		'Data::Dumper' => 2.136,
		'Exporter' => 5.66,
		'overload' => 0,
		'Scalar::Util' => 1.10,
		'strict' => 0,
		'Test::Deep' => 0.088,
		'Test::Exception' => 0.15,
		'Test::Pod' => 1.48,
		'Test::Pod::Coverage' => 1.10,
		'Test::More' => 1.001014,
		'Test::Warn' => 0.08,
		'warnings' => 0,
	},
	configure_requires =>
	{
		'Module::Build' => 0.4211,
	},
	meta_merge =>
	{
		resources =>
		{
			repository => 'https://github.com/ronsavage/Tree',
		},
	},
	requires      =>
	{
		'perl' => '5.6.0',
		'Scalar::Util' => 1.10,
	},
	'recursive_test_files' => 1,
	add_to_cleanup       =>
	[
		'META.yml', '*.bak', '*.gz', 'Makefile.PL',
	],
	resources =>
	{
		'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html?Name=Tree',
		'license' => 'http://opensource.org/licenses/Artistic-2.0',
	},
) -> create_build_script;
