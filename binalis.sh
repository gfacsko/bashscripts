#!/bin/bash

for l in root
do
	mkdir $l
	cd $l
	for m in a b
	do
		mkdir $m
		cd $m
		for n in c d
		do
			mkdir $n
			cd $n
			for o in e f
			do
				mkdir $o
				cd $o
				for p in g h
				do
					mkdir $p
					cd $p
					for r in i j
					do
						touch $r
					done
					cd ..
				done
				cd ..
			done
			cd ..
		done
		cd ..
	done
	cd ..
done

