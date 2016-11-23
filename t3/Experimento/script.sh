#!/bin/bash

gcc inverseC.c -o inverseC -llapack
gfortran -o inverseLapack inverseLapack.f90 -llapack

qtdRodadas=5
i=0

rm resultado.txt

while test $i -le $qtdRodadas 
do
	# Octave
	echo "Execução OCTAVE " >> resultado.txt
	octave criacaoMatriz.m  >> resultado.txt

	# Fortran
	echo "Execução FORTRAN " >> resultado.txt
	./inverseLapack		 >> resultado.txt

	# C
	#echo "Execução C " >> resultado.txt
	#./inverseC 	   >> resultado.txt
	
	i=`expr $i + 1`
done
