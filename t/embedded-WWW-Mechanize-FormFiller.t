#!D:\Programme\indigoperl-5.6\bin\perl.exe -w

use Test::More 'no_plan';

package Catch;

sub TIEHANDLE {
    my($class, $var) = @_;
    return bless { var => $var }, $class;
}

sub PRINT  {
    my($self) = shift;
    ${'main::'.$self->{var}} .= join '', @_;
}

sub OPEN  {}    # XXX Hackery in case the user redirects
sub CLOSE {}    # XXX STDERR/STDOUT.  This is not the behavior we want.

sub READ {}
sub READLINE {}
sub GETC {}
sub BINMODE {}

my $Original_File = 'D:lib\WWW\Mechanize\FormFiller.pm';

package main;

# pre-5.8.0's warns aren't caught by a tied STDERR.
$SIG{__WARN__} = sub { $main::_STDERR_ .= join '', @_; };
tie *STDOUT, 'Catch', '_STDOUT_' or die $!;
tie *STDERR, 'Catch', '_STDERR_' or die $!;

SKIP: {
    # A header testing whether we find all prerequisites :
      # Check for module WWW::Mechanize::FormFiller
  eval { require WWW::Mechanize::FormFiller };
  skip "Need module WWW::Mechanize::FormFiller to run this test", 1
    if $@;

  # Check for module strict
  eval { require strict };
  skip "Need module strict to run this test", 1
    if $@;


    # The original POD test
        undef $main::_STDOUT_;
    undef $main::_STDERR_;
eval q{
  my $example = sub {
    local $^W = 0;

#line 124 lib/WWW/Mechanize/FormFiller.pm
  use strict;
  use WWW::Mechanize::FormFiller;

  # Create a form filler that fills out google for my homepage

  my $html = "<html><body><form name='f' action='http://www.google.com/search'>
      <input type='text' name='q'>
      <input type='submit' name=btnG value='Google Search'>
      <input type='hidden' name='secretValue' value='0xDEADBEEF' />
    </form></body></html>";

  my $f = WWW::Mechanize::FormFiller->new( q => [Fixed => "Corion Homepage"] );
  my $form = HTML::Form->parse($html,"http://www.google.com/intl/en/");
  $f->fill_form($form);

  my $request = $form->click("btnG");
  # Now we have a complete HTTP request, which we can hand off to
  # LWP::UserAgent or (preferrably) WWW::Mechanize

  print $request->as_string;











;

  }
};
is($@, '', "example from line 124");

};
SKIP: {
    # A header testing whether we find all prerequisites :
      # Check for module HTML::Form
  eval { require HTML::Form };
  skip "Need module HTML::Form to run this test", 1
    if $@;

  # Check for module WWW::Mechanize::FormFiller
  eval { require WWW::Mechanize::FormFiller };
  skip "Need module WWW::Mechanize::FormFiller to run this test", 1
    if $@;

  # Check for module WWW::Mechanize::FormFiller::Value::Interactive
  eval { require WWW::Mechanize::FormFiller::Value::Interactive };
  skip "Need module WWW::Mechanize::FormFiller::Value::Interactive to run this test", 1
    if $@;

  # Check for module strict
  eval { require strict };
  skip "Need module strict to run this test", 1
    if $@;


    # The original POD test
    {
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 124 lib/WWW/Mechanize/FormFiller.pm
  use strict;
  use WWW::Mechanize::FormFiller;

  # Create a form filler that fills out google for my homepage

  my $html = "<html><body><form name='f' action='http://www.google.com/search'>
      <input type='text' name='q'>
      <input type='submit' name=btnG value='Google Search'>
      <input type='hidden' name='secretValue' value='0xDEADBEEF' />
    </form></body></html>";

  my $f = WWW::Mechanize::FormFiller->new( q => [Fixed => "Corion Homepage"] );
  my $form = HTML::Form->parse($html,"http://www.google.com/intl/en/");
  $f->fill_form($form);

  my $request = $form->click("btnG");
  # Now we have a complete HTTP request, which we can hand off to
  # LWP::UserAgent or (preferrably) WWW::Mechanize

  print $request->as_string;











  no warnings 'once';
  require HTML::Form;
  require WWW::Mechanize::FormFiller::Value::Interactive;
  *WWW::Mechanize::FormFiller::Value::Interactive::ask_value = sub { "s3[r3t" }; #<-- not a good password

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

};
SKIP: {
    # A header testing whether we find all prerequisites :
    
    # The original POD test
        undef $main::_STDOUT_;
    undef $main::_STDERR_;

};
SKIP: {
    # A header testing whether we find all prerequisites :
    
    # The original POD test
        undef $main::_STDOUT_;
    undef $main::_STDERR_;
eval q{
  my $example = sub {
    local $^W = 0;

#line 161 lib/WWW/Mechanize/FormFiller.pm

  # Create a form filler that asks us for the password

  # Normally, the HTML would come from a LWP::UserAgent request
  my $html = "<html><body><form name='f' action='/login.asp'>
    <input type='text' name='login'>
    <input type='password' name='password' >
    <input type='submit' name=Login value='Log in'>
    <input type='hidden' name='session' value='0xDEADBEEF' />
  </form></body></html>";

  my $f = WWW::Mechanize::FormFiller->new();
  my $form = HTML::Form->parse($html,"http://www.fbi.gov/super/secret/");

  $f->add_filler( password => Interactive => []);
  $f->fill_form($form);

  my $request = $form->click("Login");

  # Now we have a complete HTTP request, which we can hand off to
  # LWP::UserAgent or (preferrably) WWW::Mechanize
  print $request->as_string;




;

  }
};
is($@, '', "example from line 161");

};
SKIP: {
    # A header testing whether we find all prerequisites :
    
    # The original POD test
    {
    undef $main::_STDOUT_;
    undef $main::_STDERR_;
#line 161 lib/WWW/Mechanize/FormFiller.pm

  # Create a form filler that asks us for the password

  # Normally, the HTML would come from a LWP::UserAgent request
  my $html = "<html><body><form name='f' action='/login.asp'>
    <input type='text' name='login'>
    <input type='password' name='password' >
    <input type='submit' name=Login value='Log in'>
    <input type='hidden' name='session' value='0xDEADBEEF' />
  </form></body></html>";

  my $f = WWW::Mechanize::FormFiller->new();
  my $form = HTML::Form->parse($html,"http://www.fbi.gov/super/secret/");

  $f->add_filler( password => Interactive => []);
  $f->fill_form($form);

  my $request = $form->click("Login");

  # Now we have a complete HTTP request, which we can hand off to
  # LWP::UserAgent or (preferrably) WWW::Mechanize
  print $request->as_string;




  isa_ok($f,"WWW::Mechanize::FormFiller");
  $_STDOUT_ =~ s/[\x0a\x0d]+$//;
  like($_STDOUT_,qr"^GET http://www.fbi.gov/login.asp\?login=&(password=.*?&)?Login=Log\+in&session=0xDEADBEEF",'Got the expected HTTP query string');

    undef $main::_STDOUT_;
    undef $main::_STDERR_;
}

};
SKIP: {
    # A header testing whether we find all prerequisites :
    
    # The original POD test
        undef $main::_STDOUT_;
    undef $main::_STDERR_;

};
SKIP: {
    # A header testing whether we find all prerequisites :
    
    # The original POD test
        undef $main::_STDOUT_;
    undef $main::_STDERR_;
eval q{
  my $example = sub {
    local $^W = 0;

#line 216 lib/WWW/Mechanize/FormFiller.pm

  # This filler fills all unspecified fields
  # with the string "<purposedly left blank>"
  my $f = WWW::Mechanize::FormFiller->new(
    default => [ Fixed => "<purposedly left blank>" ]);

  # This filler automatically fills in a username
  # and asks for a password
  my $f = WWW::Mechanize::FormFiller->new(
                       values => [[ login => Fixed => "corion" ],
                                  [ password => Interactive => [],
                                 ]]);

  # This filler only fills in a username
  # if it is the empty string, and still asks for the password :
  my $f = WWW::Mechanize::FormFiller->new(
                       values => [[ login => Default => "corion" ],
                                  [ password => Interactive => [],
                                 ]]);

;

  }
};
is($@, '', "example from line 216");

};
SKIP: {
    # A header testing whether we find all prerequisites :
    
    # The original POD test
        undef $main::_STDOUT_;
    undef $main::_STDERR_;

};
