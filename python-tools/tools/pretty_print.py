import re
from inspect import isclass

import datetime as dt

def ap(a, ll=1000, ind=True, indent_cnt=0):
    """
    prints the top level of an array by line with indices
    """
    a = list(a) # in case the type isn't strictly a list
    out = ""
    for i in range(len(a)):
        indent = (' ' * indent_cnt)
        ind_str = ''
        if ind: ind_str = str(i) + ": "
        final_line = indent + ind_str + str(a[i])
        if len(final_line) > ll:
            final_line = final_line[:(ll-3)] + "..."
        out += final_line + "\n"

    # remove the trailing "newline"
    print (out[:-1])

def dp(d):
    """
    prints the key-value pairs of python dict
    prints number values first in order (small->great)
    """
    try: # If all vals are integers, sort them
        d = {k: v for k, v in sorted(d.items(), key=lambda item: item[1])}
    except: pass

    out = ""
    for key in d.keys():
        value = d.get(key)
        final_line = "KEY: " + str(key) + "\nVALUE: " + str(value) + "\n\n"
        out += final_line
    print (out)

# PRETTY TYPE
def pt(obj, pr=True):
    
    replace_dict = {
        'builtin_function_or_method': 'fn/method'
    }

    str_type = str(type(obj))

    if str_type.count('\'') == 2:
        out_type = re.findall(r"'([^']*)", str_type)[0]
        if out_type in replace_dict:
            out_type = replace_dict[out_type]
        return out_type
    else:
        raise Warning(f"Can't parse type: {str_type}")

# PRETTY DIR
def pd(obj, ind_cnt=2, every=False):
    """
    runs "dir" function on the input object and pretty prints the output
    """
    
    indent = " " * ind_cnt

    attrs = dir(obj)
    primatives = []
    customs = []
    
    for attr in attrs:
        
        # Omit Python built_in functions and properties (unless
        # 'all' optional arg is set to True) 
        if attr[:2] == '__' and not every: continue
        
        val = getattr(obj, attr)
        
        is_custom = isclass(val)
        
        attr_type = pt(val, pr=False)

        try:
            val = val()
        except:
            if type(val) not in [list, int, str, float, bool]:
                val = ""

        if is_custom: customs += [(attr_type, attr, val)]
        else: primatives += [(attr_type, attr, val)] 
        
    primatives.sort(key=lambda item:len(item[0]))
    customs.sort(key=lambda item:len(item[0]))

    output_lists = [primatives, customs]
    
    print('\n', end="")
    print(f'TYPE: {pt(obj)}')
    print('\n', end="")
    for i in range(len(output_lists)):

        l = output_lists[i]

        # If there are no items in the list, continue
        if not l: continue
        
        if i: print('CUSTOMS:')
        else:print('PRIMATIVES:')

        attr_max = len(max(l, key=lambda item: len(item[1]))[1])
        attr_type_max = len(max(l, key=lambda item: len(item[0]))[0])

        for attr_type, attr, val in l:
            
            attr_pad = " " * (attr_max - len(attr))
            attr_type_pad = " " * (attr_type_max - len(attr_type))

            print(indent + f"{attr}" + attr_pad + f" : {attr_type}" + attr_type_pad + f" : {val}")
        print('\n', end="")