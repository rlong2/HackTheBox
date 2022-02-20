#!/bin/bash
#
# This script prompts the user for a box name and creates a directory for it
# along with a template file to keep notes

MAIN_PATH=/home/ryan/HackTheBox    # The directory to search recursively
FILE_TYPE=*_user.txt                 # Only searches files of this type

# If there are no arguments supplied, prompt the user
if [ $# -eq 0 ]; then
    echo "Provide a box name by adding an argument."
    echo ""
    echo "Example:"
    echo "$0 Meow           # Creates a directory for VM to pwn named Meow"
    echo "$0 -h             # Help"
    echo ""
    exit 0

# If the user wants help. display more information
elif [ "$1" == "-h" ]; then
    echo "Options:"
    echo " -h: Print this help text"
    echo "$0 Meow            # Creates a directory for VM to pwn named Meow"
    exit 0

# If the user supplied arguments, search for the string(s)
else

    # Create the folder if it does not exist
    echo "Creating $MAIN_PATH/$1"
    mkdir -p $MAIN_PATH/$1
    echo "Copying and creating template"
    cp $MAIN_PATH/_Assorted_Files/user_template.txt $MAIN_PATH/$1/$1_user.txt
    ls -l $MAIN_PATH/$1

fi
