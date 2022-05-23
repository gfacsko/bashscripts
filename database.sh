# database.sh: Emulates a database
#
# Usage: database filename1 filename2
#
# filename1: the name of database file
# filename2: the name of database file
#
# Developed by Gabor FACSKO (facsko.gabor@uni-milton.hu)i
# Milton Friedman University, Budapest, Hungary, 2022
#
# -----------------------------------------------------------------------------------------------
#
#!/bin/bash

# User feedback
echo "Processing "$1", "$2

# Start value 
MAXAGE=991231

# Start female height
MINHEIGHT=300

# Start male height
MAXHEIGHT=1

for s in $(cut -f1 $2)
do
	# Create database
	SAMPLE="$(echo $s|cut -f1)"
	LINE="$(grep $SAMPLE $1)"
	LINE2="$(grep $SAMPLE $2)"

	# Attach tables
	if [ -n LINE ] && [ -n LINE2 ]
	then
		echo $LINE 
		echo $LINE2

		# Birth Year
		BY=$(echo $LINE2 | cut -c2-7|bc -l)

		# Select larger age
		if [ $MAXAGE -gt $BY ]
		then
			MAXAGE=$BY
		fi	

		# Height
		H=$(echo $LINE2 | cut -f2 -d' '|cut -c1-3|bc -l)

		# Gender
		G=$(echo $LINE2 | cut -c1)

		# Select less height
		if [ $H -lt $MINHEIGHT ] && [ $G -eq 1 ] 
		then
			MINHEIGHT=$H
		fi

		# Select larger height
		if [ $H -gt $MAXHEIGHT ] && [ $G -eq 2 ]
		then
			MAXHEIGHT=$H			
		fi	
	fi


done 

# Print the name of the oldest person
echo "The oldest person is "$(grep $MAXAGE $1|cut -f1)

# Print the name of the shortest male
echo "The shortest male is "$(grep $(grep $MINHEIGHT $2|cut -f1) $1|cut -f1)

# Print the name of the tallest female
echo "The tallest female is "$(grep $(grep $MAXHEIGHT $2|cut -f1) $1|cut -f1)




