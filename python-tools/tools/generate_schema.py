def sp(list_of_objs):
	if type(list_of_objs) != list:
		list_of_objs = [list_of_objs]

	schema_dict = schema_help(list_of_objs)
	schema_print(schema_dict)

def schema_help(list_of_objs):
	out_schema = {}
	
	for o in list_of_objs:
		for k,v in o.items():
			v_type = str(type(v)).split('\'')[1]
			if v_type == 'NoneType': continue
			if v_type == 'dict':
				try:				
					if type(out_schema[k]) == list:
						out_schema[k] += [v]
					else: print("KEY: " + str(k) + "\nVAL1_TYPE: " + v_type + "\nVAL2_TYPE: " + out_schema[k] )
				except:
					out_schema[k] = [v]
			else:
				try:				
					if out_schema[k] == v_type: continue
					else: print("KEY: " + str(k) + "\nVAL1_TYPE: " + v_type + "\nVAL2_TYPE: " + out_schema[k] )
				except:
					out_schema[k] = v_type

	for k,v in out_schema.items():
		if type(v) == list:
			out_schema[k] = schema_help(v)

	return out_schema

def schema_print(schema_dict, ind=0):
	for k,v in schema_dict.items():
		p_str = ' ' * ind + k + ':'
		if type(v) == dict:
			print(p_str)
			schema_print(schema_dict[k], ind+2)
		else:
			p_str = p_str + ' ' + v
			print(p_str)