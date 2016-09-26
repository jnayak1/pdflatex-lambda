#!/bin/sh
while read name
do
	cp $name ./texlive-scheme-basic
done < tlsb_files_with_sub_files.txt

