use strict;
use Test::More tests => 4;
use HTML::Form;

BEGIN {
  use_ok("WWW::Mechanize::FormFiller");
};

my $f = WWW::Mechanize::FormFiller->new( values => [[ check => Fixed => "baz"]]);
isa_ok($f,"WWW::Mechanize::FormFiller");

my $form = HTML::Form->parse(q(
  <html><body><form name="f">
    <input type="checkbox" name="check" value="foo">
    <input type="checkbox" name="check" value="bar">
  </form></body></html>
),'http://www.example.com');

{
  eval { $f->fill_form($form) };
  isnt($@,undef,"We (resp. HTML::Form) croaked on invalid values for a field");
  like($@,qr/^Field 'check' had illegal value: baz at/,"We croaked for the field 'check'");
};
