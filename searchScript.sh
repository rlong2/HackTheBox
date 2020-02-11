#!/bin/bash
#
# This script intends to make searching through my HackTheBox documentation easier
# so I can easily find commands, keywords, etc.
# Feel free to edit this script however you wish.

SEARCH_PATH=/home/ryan/HackTheBox/    # The directory to search recursively
FILE_TYPE=*_user.txt                  # Only searches files of this type

# If there are no arguments supplied, prompt the user
if [ $# -eq 0 ]; then
    echo "Provide a search string!"
    echo ""
    echo "$0 foo            # Searches for foo"
    echo $0 $'"foo|bar"      # Searches for foo or bar'
    echo "$0 -h             # Help"
    echo ""
    exit 0

# If the user wants help. display more information
elif [ "$1" == "-h" ]; then
    echo "This script recursively searches $SEARCH_PATH for strings in $FILE_TYPE files."
    echo "It is a simplified way to use egrep to search recursively"
    echo "If you wish to change where $0 searches or change the files it searches through,"
    echo "edit SEARCH_PATH and FILE_TYPE at the top of this script."
    echo ""
    echo "Options:"
    echo " -h: Print this help text"
    echo "$0 foo            # Searches for foo"
    echo $0 $'"foo|bar"      # Searches for foo or bar'
    exit 0

# If the user supplied arguments, search for the string(s)
else

    echo  egrep -rin "$*" --include=$FILE_TYPE $SEARCH_PATH    # Display the command being run
    echo ""
    egrep -rin "$*" --include=$FILE_TYPE $SEARCH_PATH

fi
