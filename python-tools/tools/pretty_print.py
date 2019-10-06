def ap(a, ll=80, ind=False):
    """
    prints the top level of an array by line with indices
    """
    out = ""
    for i in range(len(a)):
        indent = (' ' * indent_cnt)
        ind_str = ''
        if ind: ind_str = str(i) + ": "
        final_line = indent + ind_str + str(a[i])
        if len(final_line) > line_limit:
            final_line = final_line[:(line_limit-3)] + "..."
        out += final_line + "\n"

    # remove the trailing "newline"
    print (out[:-1])

def dp(d):
    """
    prints the key-value pairs of python dict
    """
    out = ""
    for key in d.keys():
        value = d.get(key)
        final_line = "KEY: " + str(key) + "\nVALUE: " + str(value) + "\n\n"
        out += final_line
    print (out)

def pt(obj, pr=True):
    simplified = {
        "builtin_function_or_method" : "function",
        "method-wrapper" : "wrapper",
    }
    str_type = str(type(obj))
    str_type = str_type.replace("<type '","")
    str_type = str_type[:-2]
    try: str_type = simplified[str_type]
    except: pass
    if pr: print (str_type)
    else: return (str_type)


def filterFunctions(items):
    values = []
    non_values = []
    for item in items:
        if item in ["function", "wrapper"]:
            non_values += [item]
        else:
            values += [item]
    return values, non_values

def pd(obj):
    """
    runs "dir" function on the input object and pretty prints the output
    """
    attrs = dir(obj)
    items = []
    for attr in attrs:
        value = getattr(obj, attr)
        val_type = ptype(value, pr=False)
        val_str = ": " +  str(value)
        if val_type in ["function", "wrapper"]: val_str = ""
        bundle = (val_type, attr, val_str)
        items += [bundle]
    
    values, non_values = filterFunctions(items)
    values.sort()
    items = non_values + values
    
    type_set = list(set(map(lambda x: x[0], items)))
    type_set.sort(key=len)
    max_len = len(type_set[-1])

    for bundle in items:
        val_type, attr, value = bundle
        val_str = str(value)
        val_str = val_str.replace("\n","...")
        if len(val_str) > 78: val_str = val_str[:78] + "..."
        extra = " " * (max_len - len(val_type))
        type_str = "(" + val_type + ") " + extra

        line = ( type_str + attr + val_str)
        print (line)
    print ("TYPE: %s" % ptype(obj, pr=False))
