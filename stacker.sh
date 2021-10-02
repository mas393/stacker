#!/usr/bin/env bash

echo #newline for aesthetics
ls -cltr #print files with dates to help user
echo

read -p 'Files sent to stack when last modified before the date (yyyy-mm-dd): ' date
#check for stacks folder and create one if not there

mkdir -p stacks #make stacks folder if not there, with -p option so no error if existing

ls -cltr | python stacker.py $date | while read file; do #each line is a file that will be moved
    #could add interactive option and check each file here
    mv $file stacks
done

