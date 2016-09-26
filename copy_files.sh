#!/bin/sh
while read name
do
	cp $name ./texlive-scheme-basic
done < tlsb_files2.txt

