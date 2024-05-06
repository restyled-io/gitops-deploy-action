import sys
import argparse

from . import main

parser = argparse.ArgumentParser()
parser.add_argument("path", metavar="PATH", help="Stack file to read/write")
parser.add_argument("name", metavar="NAME", help="Parameter Name to set")
parser.add_argument("value", metavar="VALUE", help="Paramater Value to set")
args = parser.parse_args()

try:
    main(args.path, args.name, args.value)
except Exception as ex:
    print("{}".format(ex), file=sys.stderr)
    sys.exit(1)
