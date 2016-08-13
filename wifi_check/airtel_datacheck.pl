#!/bin/perl
use File::Spec;
use HTML::TreeBuilder;

sub  trim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

my $filename = File::Spec->catfile(@ARGV[0]);
my $filedata = "";

open(my $fh, '<:', $filename);

while (my $row = <$fh>) {
  chomp $row;
  $filedata .= $row;
}

my $tree = HTML::TreeBuilder->new_from_content($filedata);

my $data = $tree->look_down(
    _tag  => 'div',
    class => 'detail'
);

my $dataTree = HTML::TreeBuilder->new_from_content($data->as_HTML());
#print $dataTree;
my @spans = $dataTree->find('span');
my $bandwidth = @spans[0]->as_text();
print trim(substr($bandwidth, 0, 5));

#print $data->as_HTML(), "\n" if $data; #prints '15' using the given HTML
