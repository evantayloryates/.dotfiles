from os import walk, path



def get_files(parent_dir, recursive=True):
    """Return the square root of self times self."""
    f = []
    for (dirpath, dirnames, filenames) in walk(parent_dir):
        def stitch(filename):
            return dirpath + "/" + filename
        full_paths = list(map(stitch, filenames))
        f.extend(full_paths)
        if not recursive:
            break
    return f

def get_file_content(filepath):
    f = open(filepath, "r")
    return f.read()

def get_exts(filepath, all_exts=True):
    """
    returns a list of file extensions for a particular file as they 
    occur from left to right

      filepath            -> STRING representing a filename that 
                             may or may not include the entire path

      all_exts (optional) -> BOOLEAN that indicates whether or not all 
                             extensions should be collected, or just 
                             the outermost extension. 

      e.g. 

        get_exts("test.ext1.ext2") -> ['ext1', 'ext2']
        get_exts("test.ext1.ext2", all_exts=False) -> ['ext2']
    """
    
    ext = 42 # initialize and set to non-0 value
    out = [] # the output array of extensions
    
    while ext:
        filepath, ext = path.splitext(filepath)

        if ext:
            clean_ext = ext[1:] # strip the "." off the front of ext
            out = [clean_ext] + out # append to output array
        if not all_exts: break # if all_exts is False then end the
                               # loop after grabbing the first ext
    return out
