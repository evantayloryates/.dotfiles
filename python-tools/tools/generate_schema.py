
def schema(list_of_objs):
	out_schema = {}
	
	for o in list_of_objs:
		for k,v in o.items():
			v_type = str(type(v)).split('\'')[1]
			try:				
				if out_schema[k] == v_type: continue
				else: print("KEY: " + str(k) + "\nVAL1_TYPE: " + v_type + "\nVAL2_TYPE: " + out_schema[k] )
			except:
				out_schema[k] = v_type
	return out_schema

	