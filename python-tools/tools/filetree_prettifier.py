import sys
import tools

unhandled_exts = []

def pretty_py(fp): print("Python")
def pretty_json(fp): print("JSON")
def pretty_html(fp):print("HTML")
def pretty_css(fp): print("CSS")
def pretty_js(fp): print("JavaScript")
def no_fn(fp): unhandled_exts += [get_ext(fp)]
functions = {
    ".py": pretty_py,
    ".json": pretty_json,
    ".html": pretty_html,
    ".css": pretty_css,
    ".js": pretty_js
}

if __name__ == "__main__":
    # target_dir = sys.argv[1]
    # filepaths = get_files(target_dir)

    # for f in filepaths:
    #     ext = get_ext(f)
    #     functions.get(ext, no_fn).__call__(f)
        
    # # aprint(filepaths)

    print (tools.get_exts("/thing/adfsa/sdfdsaf.pretty.html"))

