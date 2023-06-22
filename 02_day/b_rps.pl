use strict;
use warnings;

my $filename = 'input/input.txt';
  open(my $fh, '<encoding(UTF-8)', $filename)
    or die "Could not open file '$filename' $!";

# Second columns says how the round needs to end.
# A = Rock (1), B = Paper (2), C = Scissor (3)
# X means I need to lose (0), Y means to draw (3), and Z means to win (6)

my $total_score = 0;

while (my $row = <$fh>) {
  chomp $row;
# There's a space between the two letters per row. Deconstructing
  my ($oppo_move, $desired_outcome) = split / /, $row;
  my ($score, $outcome);

  # Determine what the outcome is and then determine your move
  if($desired_outcome eq 'X') {
    # X means we need to lose, so a few more conditionals here
    if($oppo_move eq 'A') {
      # Means I would have to play scissor
      { $score = 3; $outcome = 0; }
    } elsif ($oppo_move eq 'B') {
      { $score = 1; $outcome = 0; }
    } else {
      { $score = 2; $outcome = 0; }
    }
  }

# Draw
  if($desired_outcome eq 'Y') {
      if($oppo_move eq 'A') {
        { $score = 1; $outcome = 3; }
      } elsif ($oppo_move eq 'B') {
        { $score = 2; $outcome = 3; }
      } else {
        { $score = 3; $outcome = 3; }
      }
    }

# Win
  if($desired_outcome eq 'Z') {
      if($oppo_move eq 'A') {
        { $score = 2; $outcome = 6; }
      } elsif ($oppo_move eq 'B') {
        { $score = 3; $outcome = 6; }
      } else {
        { $score = 1; $outcome = 6; }
      }
    }

  $total_score += $score + $outcome;
}

close $fh;

print "The total score is: $total_score\n";