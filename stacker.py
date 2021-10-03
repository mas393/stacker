# Author: Matthew Stephenson
# Email: matthewstephenson39@gmail.com
# 2021-10-02 Personal Hackathon Project
# Determines whether a file has been modified since a given date
#  outputting the filenames of those which have not

import sys
from datetime import datetime

compdate = datetime.fromisoformat(sys.argv[1])

for linenum, line in enumerate(sys.stdin):
    if linenum != 0:
        data = line.rsplit(' ')

        while True: 
            if '' in data: data.remove('')
            elif ' ' in data: data.remove(' ')
            else: break
            
        y = lambda x: str(datetime.today().year) if len(x) > 4 else x
        d = lambda x: "0"+x if len(x) < 2 else x
        date = datetime.strptime(data[5] + d(data[6]) + y(data[7]), "%b%d%Y")
        
        if date < compdate:
            #the following is needed for formatting filenames with spaces
            filename = ''
            for w in data[8:-1]:
                filename += w
                filename += r'\ '
            filename += data[-1]
            
            sys.stdout.write(filename)
