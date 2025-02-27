use Mojo::Base -strict;

use Test::More;

plan skip_all => 'set TEST_POD to enable this test (developer only!)'
  unless $ENV{TEST_POD};
plan skip_all => 'Test::Pod::Coverage 1.04+ required for this test!'
  unless eval 'use Test::Pod::Coverage 1.04; 1';

my $private = ['insert', 'new', 'puke', 'select'];
my %RULES   = ('SQL::Abstract::Pg' => {also_private => $private},);
pod_coverage_ok($_, $RULES{$_} || {}) for all_modules();

done_testing();
