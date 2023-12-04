from itertools import groupby
from operator import itemgetter
import sys

current_word = None
current_count = 0

# Read input from stdin
for line in sys.stdin:
    # Split the input into key and value
    word, count = line.strip().split("\t")

    # Convert count to an integer
    count = int(count)

    # Check if the word has changed
    if current_word == word:
        current_count += count
    else:
        # Emit the result for the previous word
        if current_word:
            print(f"{current_word}\t{current_count}")
        
        # Update the current word and count
        current_word = word
        current_count = count

# Emit the result for the last word
if current_word:
    print(f"{current_word}\t{current_count}")