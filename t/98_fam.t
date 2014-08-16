# -*- perl -*-

use strict;
use warnings;

use Test::More tests => 14;
BEGIN { use_ok('File::Slurp') };
BEGIN { use_ok('Graphics::Magick') };
BEGIN { use_ok('OCBNET::WebSprite') };

use OCBNET::CSS3::Styles::WebSprite;

# change directory into css location
ok chdir('t/fam/generate'), "chdir";

# create new spriteset object
my $spriteset = OCBNET::WebSprite->new;

# check for valid object
ok $spriteset, "instantiate";

# read in data from css file
my $data = read_file('fam.css');

# check for valid object
ok $data, "read fam.css";

# empty hash
my $opt = {};

# start the main process for creation
# opt will be shared with writer and reader
# can be used to keep spritesets in memory
ok my $rv = $spriteset->create(\$data, $opt), "create spriteset";


ok -f '../result/expected.png', "expected.png exists";
ok -f '../result/generated.png', "generated.png exists";
ok my $expected = Graphics::Magick->new, "instantiates expected";
ok my $generated = Graphics::Magick->new, "instantiates generated";
is $expected->Read('../result/expected.png'), '', "read expected.png";
is $generated->Read('../result/generated.png'), '', "read generated.png";

# use gm compare to create equality metrics to check if generated image is correct
my $compare = `gm compare -metric mse ../result/expected.png ../result/generated.png`;
is scalar(() = $compare =~ m/\:\s*0?\.000/g), 5, "generated image matches expected";