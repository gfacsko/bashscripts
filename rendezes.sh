#!/bin/bash

for w in $(cat lorem.txt)
do 
	echo $w
done|sort -u

