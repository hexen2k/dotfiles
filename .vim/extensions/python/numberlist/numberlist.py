import sys

if len(sys.argv) >= 2:
    counter = int(sys.argv[1])
else:
    counter = 1

if len(sys.argv) >= 3:
    step = int(sys.argv[2])
else:
    step = 1

for line in sys.stdin:
    striped_line = line.strip()
    if striped_line:
        print(str(counter) + '. ' + line, end='')
        counter += step
    else:
        print(line, end='')
