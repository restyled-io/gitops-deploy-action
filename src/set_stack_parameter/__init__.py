from ruamel.yaml import YAML

yaml = YAML()
yaml.indent(mapping=2, sequence=4, offset=2)

class ParameterNotFound(Exception):
    def __init__(self, name, path):
        message = "No Parameter with Name {} found in {}".format(name, path)
        super().__init__(message)

def rewrite(contents, name, value):
    stack = yaml.load(contents)
    updated = False

    for parameter in stack.get("Parameters"):
        if parameter.get("Name") == name:
            parameter.insert(2, "Value", value)
            updated = True

    if updated:
        return stack

    return None

def main(path, name, value):
    with open(path, "r") as h:
        contents = h.read()

    stack = rewrite(contents, name, value)

    if not stack:
        raise ParameterNotFound(name, path)

    with open(path, "w") as h:
        yaml.dump(stack, h)
