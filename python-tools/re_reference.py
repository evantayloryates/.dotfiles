# A Cheat Sheet for Python Regular expressions

import re

# Up to but not including
char = '['
print(re.match(r'(?:(?!\%s).)*' % char, 'up to here[char]').group())
