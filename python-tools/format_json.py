import json
import sys

try:
	file = argv[1]
except:
	print("Please include a file to format")
	exit(1)

print(file)