import re
import gdb

class NimStringPrinter(object):
    "Print a Nim string"

    def __init__(self, val):
        self.val = val

    def to_string(self):
        return self.val['data']

    def display_hint(self):
        return 'string'

def string_lookup_function(val):
    lookup_tag = val.type.tag

    if lookup_tag == None:
        return None

    regex = re.compile("^NimStringDesc$")

    if regex.match(lookup_tag):
        return StdStringPrinter(val)

    return None

def register_printers(objfile):
    objfile.pretty_printers.append(string_lookup_function)

gdb.pretty_printers.append(string_lookup_function)
