use strict;
use warnings;

my $filename = 'input/calories.txt'; # file path and name
# print "The current filename is: $filename\n";

# File handle -> This is essentially a pointer to the file that lets
# the script read from or write to it.
open(my $fh, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";


# # This is how you print the pointer file. $fh is holding that pointer.
# while (my $line = <$fh>) {
#   print $line;
# }

# Setting Variables
my $max_calories = 0; # To store the max calories carried by any elf
my $current_calories = 0; # To store the calories carried by the current elf

while (my $row = <$fh>) { # While row exists (bc row take each line by line)
  chomp $row; # EATS THAT WHITE SPACE
  if ($row eq '') { # If we encounter a blank line
    $max_calories = $current_calories if $current_calories > $max_calories;
    $current_calories = 0; # Reset current elf's calories
  } else { # If the line contains a number
    $current_calories += $row; # Add to current elf's calories
  }
}

# After reading all lines, check if the last elf has the max calories
$max_calories = $current_calories if $current_calories > $max_calories;


print "$max_calories\n";
close($fh); # Close the file handle after reading

# Questions for Gippity
#// Why does perl use $ to set variables?
#// What does the command 'or die' do, and why is it called that?
#// Is there another way to set variables?
#// What does chomp do?
# Why do you have to close($fh)?