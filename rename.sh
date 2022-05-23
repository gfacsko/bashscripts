# rename.sh: Renames the data file and add the first and last measurements time to the filename.
#
# Usage: rename.sh filename
#
# filename: the name of the datafile
#
# Developed by Gabor FACSKO (facsko.gabor@uni-milton.hu)i
# Milton Friedman University, Budapest, Hungary, 2022
#
# -----------------------------------------------------------------------------------------------
#

#!/bin/bash

# User feedback
echo "Processing "$1

# First time
START="$(grep -v "#" $1|head -n 3|tail -n 1|cut -f1,2 -d' ')"

# Last time
END="$(grep -v "#" $1|tail -n 1|cut -f1,2 -d' ')"

# The begining of the filename
PREFIX="$(echo $(echo $1|cut -f1-3 -d_))"

# Start string
FNSTART="$(echo $(echo $START|cut -c 7-10)$(echo $START|cut -c 4-5)$(echo $START|cut -c 1-2)T$(echo $START|cut -c 12-13)$(echo $START|cut -c 15-16)$(echo $START|cut -c 18-19))"

# End string
FNEND="$(echo $(echo $END|cut -c 7-10)$(echo $END|cut -c 4-5)$(echo $END|cut -c 1-2)T$(echo $END|cut -c 12-13)$(echo $END|cut -c 15-16)$(echo $END|cut -c 18-19))"

# Hardlink to the old file
ln -f $1 $(echo $PREFIX-$FNSTART-$FNEND.dat)



