use strict;
use warnings;

# Open the file
my $filename = 'input/calories.txt'; # $filename is kinda like a pointer here
open (my $fh, '<:encoding(UTF-8)', $filename)
    or die "Could not open the file '$filename'$!";

my @calorie_totals = (0);

while (my $line = <$fh>) {
    chomp($line);

    if($line eq '') {
        push @calorie_totals, 0;
        next;
    }

    # Add the current line (calories count) to the last index 
    $calorie_totals[-1] += $line;
}

my $top_three_total = 0;

foreach my $calories (sort { $b <=> $a } @calorie_totals) {
    $top_three_total += $calories;
    last if ++$calories >= 3;
}

print "The total calories carried by the top three Elves is $top_three_total. \n";


close($fh);



