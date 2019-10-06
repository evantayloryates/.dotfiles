import sys
color_dict = {
	"BLACK" : "\033[0;30m",
	"RED"   : "\033[1;31m",
	"GREEN" : "\033[0;32m",
	"ORANGE" : "\033[0;33m",
	"BLUE"  : "\033[1;34m",
	"PURPLE"  : "\033[1;35m",
	"CYAN"  : "\033[1;36m",
	"LIGHT_GRAY" : "\033[0;37m",
	"DARK_GRAY" : "\033[1;30m",
	"LIGHT_RED" : "\033[1;31m",
	"LIGHT_GREEN" : "\033[1;32m",
	"YELLOW" : "\033[1;33m",
	"LIGHT_BLUE" : "\033[1;34m",
	"LIGHT_PURPLE" : "\033[1;35m",
	"LIGHT_CYAN" : "\033[1;36m",
	"WHITE" : "\033[1;37m",
	"RESET" : "\033[0;0m",
	"BOLD"    : "\033[;1m",
	"REVERSE" : "\033[;7m",
	"THING" : "\033]11;#53186f\007"
}


def colors():
	sys.stdout.write("\033]11;#53186f\007")
	print("color")
	sys.stdout.write(color_dict["REVERSE"] + color_dict["WHITE"])
	print("color")
	sys.stdout.write(color_dict["ORANGE"] + color_dict["BOLD"])
	print("color")
	sys.stdout.write(color_dict["RESET"] + color_dict["BLACK"])
	print("color")
	sys.stdout.write(color_dict["RED"])
	print("color")
	sys.stdout.write(color_dict["GREEN"])
	print("color")
	sys.stdout.write(color_dict["ORANGE"])
	print("color")
	sys.stdout.write(color_dict["BLUE"])
	print("color")
	sys.stdout.write(color_dict["PURPLE"])
	print("color")
	sys.stdout.write(color_dict["CYAN"])
	print("color")
	sys.stdout.write(color_dict["LIGHT_GRAY"])
	print("color")
	sys.stdout.write(color_dict["DARK_GRAY"])
	print("color")
	sys.stdout.write(color_dict["LIGHT_RED"])
	print("color")
	sys.stdout.write(color_dict["LIGHT_GREEN"])
	print("color")
	sys.stdout.write(color_dict["YELLOW"])
	print("color")
	sys.stdout.write(color_dict["LIGHT_BLUE"])
	print("color")
	sys.stdout.write(color_dict["LIGHT_PURPLE"])
	print("color")
	sys.stdout.write(color_dict["LIGHT_CYAN"])
	print("color")
	sys.stdout.write(color_dict["WHITE"])
	print("color")
	sys.stdout.write(color_dict["RESET"])
	print("color")
	sys.stdout.write(color_dict["REVERSE"])
	print("color")
	sys.stdout.write(color_dict["RESET"])

# sys.stdout.write(RED)
# sys.stdout.write(REVERSE + CYAN)
# sys.stdout.write(RESET)