use strict;
use warnings;

use ExtUtils::MakeMaker;
use Alien::OTR;

my $libotr = Alien::OTR->new;

my $cflags = $libotr->cflags;
my $libs   = $libotr->libs;

WriteMakefile(
    NAME              => 'Protocol::OTR',
    VERSION_FROM      => 'lib/Protocol/OTR.pm',
    PREREQ_PM         => {},
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Protocol/OTR.pm', # retrieve abstract from module
       AUTHOR         => 'Alex J. G. Burzyński <ajgb\@cpan.org>') : ()),
    LICENSE           => 'perl',
    LIBS              => [$libs], # e.g., '-lm'
    INC               => "-I. $cflags", # e.g., '-I. -I/usr/include/other'
    CONFIGURE_REQUIRES => {
      'Alien::OTR' => '4.0.0.1',
    },
    BUILD_REQUIRES    => {
      'ExtUtils::CBuilder' => 0,
    },
);

