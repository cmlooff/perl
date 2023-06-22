use strict;
use warnings;

my %oppo_moves = ( A => 'X', B => 'Y', C => 'Z');
my %your_moves = ( X => 'A', Y => 'B', Z => 'C');
my %score_shapes = (A => 1, B => 2, C => 3);
my %outcome_scores = (
  # Your move and then Oppo move
  # Ties
  'AA' => 3,
  'BB' => 3,
  'CC' => 3,
  # Winning and Losing
  'AB' => 6,
  'AC' => 0,
  'BA' => 0,
  'BC' => 6,
  'CA' => 6,
  'CB' => 0,
);

my $filename = 'input/input.txt';
  open(my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

my $total_score = 0;

while (my $row = <$fh>) {
  chomp $row;
  my ($oppo_move, $your_move) = split / /, $row;
#  print "Opponent Move: $oppo_move\n";
#  print "My Move: $your_move\n";

  my $shape_score = $score_shapes{$your_moves{$your_move}};
  # print "Shape score: $shape_score\n";
  my $outcome_score = $outcome_scores{ $oppo_move . $your_moves{$your_move} };
  print "Outcome score: $outcome_score\n";
  my $round_score = $shape_score + $outcome_score;

  $total_score += $round_score;
}

print "Total score: $total_score\n";