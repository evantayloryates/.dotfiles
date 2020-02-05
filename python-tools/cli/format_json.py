import json
import sys
import os
try:
	file = sys.argv[1]
except:
	print("Please include a file to format")
	exit()

f = open(file, 'r')
pretty_contents = json.loads(f.read())
f.close()

f = open(file, 'w')
f.write(json.dumps(pretty_contents, indent=2))
f.close()