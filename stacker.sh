#!/usr/bin/env bash
# Author: Matthew Stephenson
# Email: matthewstephenson39@gmail.com
# 2021-10-02 Personal Hackathon Project
# Sends unused files and folders into a stacks folder in the directory where called

#code for finding script path from https://stackoverflow.com/questions/242538/unix-shell-script-find-out-which-directory-the-script-file-resides
SCRIPTPATH=$(readlink -f "$0")
SCRIPTDIR=$(dirname "$SCRIPTPATH")
PYSCRIPT="/stacker.py"
PYSCRIPTPATH="$SCRIPTDIR$PYSCRIPT"

echo #newline for aesthetics
ls -cltr #print files with dates to help user decide the input date
echo

read -p 'Files sent to stack when last modified before the date (yyyy-mm-dd): ' DATE

mkdir -p Stacks #make stacks folder if not there, with -p option so no error if existing

ls -cltr | python $PYSCRIPTPATH $DATE | while read FILENAME; do #each line is a file that will be moved
    #could add interactive option and check each file here
    echo $FILENAME " moved to stacks"
    mv "$FILENAME" stacks #mv complains when the double quotes are not placed around $FILENAME
done

