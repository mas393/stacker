# Ideas
The improved logging idea is dead in the water. In arch, the command journalctl provides logging capabilities beyond what I had the notion of undertaking.
Subsequently, I began looking at the arch wiki for inspiration.
Sadly (and thankfully), the arch wiki only describes solved problems, or ways to develop unneeded problems.
Thinking of what could actually help me daily on computers, I thought of my tendancy to create text files that are scattered around my file heirachy. A cli (or gui) to help me identify all of my loose text files (akin to loose papers) in my documents directory and present a prettied output would be useful. This idea could be an extension of the tree command. Guess what, it is part of the tree command. A related idea that would benifit my computing habits is using the tree command to move folders and files which have been dorment for a period to a stacks folder. I use the stacks folder to pile loose folders and files that I do not want distracting me from those of use.

# Idea Pitch
This cli will allow me to rapidly identify folders and files I am not using in a given directory, and segregate them to the stacks folder in the directory.

# Implementation
* Uses bash scripting, uses the results of a tree command
* the command "tree -D -i -L 1" yeild the files/directorys one level deep in the current directory (-L 1), with the last modification dat (-D), and the output lines turned off (-i).
* the output of the tree command should be used as the input to mv
* if the stacks folder does not exist, it needs to be created
* if the stacks folder does exist, it needs to be ignored regardless of the last date it was modified
* this script should perform a check prior to moving all the folders into stacks
* the reading lines section in this bash cheatsheet <https://devhints.io/bash> describes the way I can use the tree output with mv calls
* for the call to tree, we need to use the --noreport option to omit the non-file/directory information
* to have tree output the files/folders in chronilogical order (oldest modification date first) we can use the -t options
* to split the input line from tree into the date and file path I will use the method described at <https://stackoverflow.com/questions/918886/how-do-i-split-a-string-on-a-delimiter-in-bash> where the string is piped into the tr command with specified delimeter arguments
* it appears a call to $ echo "hello world" | tr " " "\n" splits the string hello world into two seperate strings based on the first break ," ", and the second break, "\n". This is the method I will use to split the tree output into date and location strings.
* disregard all previous implementation details. I am now planning on piping the output of ls (why wouldn't I have used that rather than tree in the beginning) to a python script that will return a list list of files to move based on the parsed dates and a standard input

# Thoughts
* If this script moves a folder/file into stacks which later is sought by a program in the original folder, is there a way to notify the user that the program is looking for a file that was erroneously moved? Alternativly, something in the original folder direct programs towards the stacks folder if this situation arises?
* How would this script handle the situation where the user does not have permission to modify/move the file?
