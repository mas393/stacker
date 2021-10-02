import sys
from datetime import datetime

compdate = datetime.fromisoformat(sys.argv[1])

for linenum, line in enumerate(sys.stdin):
    if linenum != 0:
        
        data = line.rsplit(' ')

        while True: 
            if '' in data: data.remove('')
            else: break
            
        y = lambda x: str(datetime.today().year) if len(x) > 4 else x
        d = lambda x: "0"+x if len(x) < 2 else x
        date = datetime.strptime(data[5] + d(data[6]) + y(data[7]), "%b%d%Y")
        
        if date < compdate: 
            sys.stdout.write(data[-1])
