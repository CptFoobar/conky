#!/bin/perl
use File::Spec;
use HTML::TreeBuilder;

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
print @spans[0]->as_text();
#print $data->as_HTML(), "\n" if $data; #prints '15' using the given HTML
