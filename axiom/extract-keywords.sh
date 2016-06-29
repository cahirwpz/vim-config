#/bin/bash

# Author: Fabio Stumbo
#
# This script is intended to extract from a pamphlet file all
# the names of all the objects (domain, category and package)
# which hare defined and then contruct from this the vim 
# syntax file
#
# Usage:
# Copy in an empty dir the pamphlet from which you want to 
# extract keys and give the command
# for i in *.pamphlet ; do ./extract-keywords.sh $i ; done
#
# NB: If you run it again, first remove old *.vim files

# Set the key we want to extract
# eg: from bookvol10.2.pamphlet we get "category"
key=`egrep -m 1 "^\)abbrev" $1 | cut --delimiter=" " -f 2`

# Set the vim syntax key, eg: axCategory
# First capitalize the first letter
# Then add "ax"
vimkey=`echo $key \
	| sed "s/.*/\u&/" \
	| sed "s/.*/ax&/"`

# Build the vim syntax file:
# - select lines starting with )abbrev
# - squeeze spaces 
# - extract the abbreviation and the name
# - split one item per line
# - add vim things; eg: Field -> syn keyword axCategory Field
# - sort (for better comparison)
egrep "^\)abbrev" $1 \
	| sed "s/\( \+\)/ /g" \
	| cut --delimiter=" " -f 3,4 \
	| sed "s/ /\n/g" \
	| sed "/^$/d" \
	| sed "s/\(^.*$\)/syn keyword $vimkey \1/" \
	| sort \
	>> $key.vim
