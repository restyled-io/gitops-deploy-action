import argparse
import sys

from . import main


def run():
    parser = argparse.ArgumentParser()
    parser.add_argument("--name")
    parser.add_argument("--value")
    parser.add_argument("paths", metavar="FILE", nargs="*")
    args = parser.parse_args()

    try:
        for path in args.paths:
            main(path, args.name, args.value)
    except Exception as ex:
        print("{}".format(ex), file=sys.stderr)
        sys.exit(1)
