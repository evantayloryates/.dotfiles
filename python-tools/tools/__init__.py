import os

EXCLUDED_FILES = ["__init__.py", "generated_importer.py"]

script_dir = os.path.dirname(os.path.realpath(__file__))
path = script_dir + "/generated_importer.py"


new_file = ""

def imp_format(imp):
	return "from tools.%s import *\n" % imp

for item in os.listdir(script_dir):
	if item not in EXCLUDED_FILES:
		name, ext = os.path.splitext(item)
		if ext == ".py":
			new_file += imp_format(name)

f = open(path, "w")
f.write(new_file)
f.close()

from tools.generated_importer import *
