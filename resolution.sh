# resolution.sh: Determnine the resolution of measurements.
#
# Usage: resolution.sh filename
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

# Save value
PREVIOUS=0

# Resolution starting value
RESOLUTION=1000000

# Data points
for d in $(grep -v "^#" $1|grep -v EPOCH|grep -v dd | awk '{printf "%i\n", sqrt($3*$3)}')
do
	# Difference of values
	R=$(($d-$PREVIOUS))
	# Absolute value of the difference
	R=$(echo "sqrt($R*$R)"|bc -l|awk '{printf "%i\n", $1}')

	# Save the better non-zero resolution
	if [ $R -lt $RESOLUTION ] && [ $R -gt 0 ]
	then
		RESOLUTION=$R
	fi

	# Save value
	PREVIOUS=$d
done

# Print the result
echo "Estimated resolution is "$RESOLUTION
