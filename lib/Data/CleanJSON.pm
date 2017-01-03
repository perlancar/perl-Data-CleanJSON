package Data::CleanJSON;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(
                       clean_json_in_place
                       clone_and_clean_json
               );

sub _clone {
    if (eval { require Data::Clone; 1 }) {
        Data::Clone::clone(@_);
    } else {
        Clone::PP::clone(@_);
    }
}

sub clean_json_in_place {
# CODE: require Data::Clean::JSON; my $cleanser = Data::Clean::JSON->new(-obj=>['unbless_ffc_inlined']); $cleanser->{src};
}

sub clone_and_clean_json {
    my $data = _clone($data);
    clean_json_in_place($data);
}

1;
# ABSTRACT: Clean data so it is safe to output to JSON

=head1 SYNOPSIS

 use Data::CleanJSON qw(clean_json_in_place clone_and_clean_json);

 clean_json_in_place($data);
 $cleaned = clone_and_clean_json($data);


=head1 DESCRIPTION

This has the same functionality as L<Data::Clean::JSON> except that the code to
perform the cleaning is pre-generated, so we no longer need L<Data::Clean>>
during runtime.


=head1 FUNCTIONS

None of the functions are exported by default.

=head2 clean_json_in_place($data)

=head2 clone_and_clean_json($data) => $cleaned



=head1 SEE ALSO

L<Data::Clean::JSON>

=cut
