use 5.008;
use strict;
use warnings FATAL => 'all';
use Module::Build;
use Software::License;
use Config;

if (-d ".git") {
    my ($dir, $manifest);
    open $manifest, ">", "MANIFEST" or die "MANIFEST: $!";
    print $manifest "MANIFEST\n";
    print $manifest `git ls-files`, "\n";
}

my $builder = Module::Build->new(
    module_name         => 'OCBNET::WebSprite',
    license             => 'GPL_3',
    dist_author         => q{Marcel Greter <marcel.greter@ocbnet.ch>},
    dist_abstract       => 'WebSprite generator from annotated CSS',
    dist_version_from   => 'lib/OCBNET/WebSprite.pm',
    release_status      => 'stable',
    create_license      => 1,
    configure_requires => {
        'Module::Build' => 0,
        'Software::License' => 0
    },
    build_requires => {
        'Test::More' => 0
    },
    requires => {
        'OCBNET::CSS3' => 0,
        'File::Slurp' => 0,
    },
    meta_merge => {
      'meta-spec' => { version => 2 },
      resources => {
        repository => {
          type => 'git',
          url => 'https://github.com/mgreter/OCBNET-WebSprite.git',
          web => 'https://github.com/mgreter/OCBNET-WebSprite',
        }
      },
    },
    add_to_cleanup     => [ 'OCBNET-WebSprite-*' ],
    $Config{cc} eq 'clang' ? (
        # clang has a bunch of asinine warnings on by default:
        extra_compiler_flags => '-Wno-parentheses -Wno-tautological-compare -Wno-unused-value',
    ) : (),
    extra_linker_flags => '',
);

$builder->create_build_script();
