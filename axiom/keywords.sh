#!/bin/sh
###################################################################
##
## Copyright (C) 2013 Ralf Hemmecke <ralf@hemmecke.org>
## Copyright (C) 2013 Fabio Stumbo <stf@unife.it>
##
###################################################################
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program. If not, see <http://www.gnu.org/licenses/>.
###################################################################
## This script is supposed to take the name of the (pan-)axiom
## executable as an argument and writes the files categories.vim,
## domains.vim, packages.vim, operations.vim in a format appropriate
## for vim.
###################################################################

# Let's make a guess
AXIOM=`find /usr/lib -type d -iname "axiom-*"`
# If you get error, set manually the following variable
#export AXIOM="/usr/lib/axiom-20120301"

# Set the axiom command
if [ "$1" = "axiom" ];
then
        if [ ! -d $AXIOM ];
        then
                echo "Please edit the script and insert the correct value"
                echo "for the Axiom directory in the \$AXIOM variable."
                exit
        fi
        EXE="$AXIOM/bin/AXIOMsys"
else
        EXE="$1 -nosman"
fi

# First generate syntax for keywords
# Every sed line does the following

# Remove garbage at the top
# Remove garbage at the bottom
# Squeeze spaces
# Split output one word per line
# Remove empty lines
# Add the vim syntax commands
keywords () {
    echo ")what $1" | $EXE \
        | sed "1,/^(/d" \
        | sed "/^(/d" \
        | sed "s/\( \+\)/ /g" \
        | sed "s/ /\n/g" \
        | sed "/^$/d" \
        | sed "s/\(^.*$\)/syn keyword ax$2 \1/" \
        > $1.vim
}

keywords categories         Category
keywords domains         Domain
keywords packages         Package

# Then generate syntax for regexps

# First system commands
# Every sed line does the following

# Remove garbage at the top
# Remove garbage at the bottom
# Squeeze spaces
# Split output one word per line
# Remove empty lines
# Add the vim syntax commands
echo ")what comm" | $EXE \
        | sed "1,/^(/d" \
        | sed "/^ \+For more/,\$d" \
        | sed "s/\( \+\)/ /g" \
        | sed "s/ /\n/g" \
        | sed "/^$/d" \
        | sed "s/\(^.*$\)/syn match axCommand \"\\\\V)\1\\\\m\"/" \
        > commands.vim

# Now axiom operations
# Every sed line does the following

# Remove garbage at the top
# Remove garbage at the bottom
# Squeeze spaces
# Split output one word per line
# Remove empty lines
# Add the vim syntax commands for axiom commands which are made up only by keywords
# Escape all backslashes in axiom commands (there are 2 of them)
# Add the vim syntax commands for axiom commands made by symbols
echo ")what op" | $EXE \
        | sed "1,/^Operations whose/d" \
        | sed "/^ /,\$d" \
        | sed "s/\( \+\)/ /g" \
        | sed "s/ /\n/g" \
        | sed "/^$/d" \
        | sed "s/\(^[a-zA-Z].*$\)/syn keyword axOperation \1/" \
        | sed "s/\\\\/\\\\\\\\/" \
        | sed "s/\(^[^s].*$\)/syn match axOperation \"\\\\V\1\\\\m\"/" \
        > operations.vim


