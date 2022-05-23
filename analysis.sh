# analysis.sh: Counts the number of words and letters in the file.
#
# Usage: ianalysis.sh filname
#
# filename: the name of the textfile
#
# Developed by Gabor FACSKO (facsko.gabor@uni-milton.hu)i
# Milton Friedman University, Budapest, Hungary, 2022
#
# -----------------------------------------------------------------------------------------------
#
#!/bin/bash

# User feedback
echo "Processing "$1

echo

# Number of words and letters
echo "Number of words: "$(wc -w $1|cut -f1 -d' ')

echo "Number of letters: "$(wc -m $1|cut -f1 -d' ')

echo

# Distribution of letters
for l in {a..z}
do
	echo "Number of "$l": "$(grep -o -i $l wigner.txt |wc -l)

done

echo

# Distribution of words
SAMPLES="$(for w in $(cat wigner.txt); do echo $w|sed -e  's/[,."-]//g'; done|sort -i -u)"

for w in $SAMPLES
do 
	echo "Number of "$w": "$(grep -o -i $w wigner.txt |wc -l)
done
