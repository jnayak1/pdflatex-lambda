#!/bin/sh
while read name
do
	find $name -type f
done < tlsb_files.txt

