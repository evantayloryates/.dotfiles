#!/usr/bin/python

import sys
import string
import random

from tools import *

DEFAULT_LENGTH = 25
AVAILABLE_CHARS = string.ascii_lowercase + string.digits


def gen_password(l, chars=AVAILABLE_CHARS):
	return ''.join(random.choice(chars) for _ in range(l))


if __name__ == "__main__":
	
	try:
		pw_length = sys.argv[1]
	except:
		pw_length = DEFAULT_LENGTH

	sys.stdout.write(gen_password(pw_length))
