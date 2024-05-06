from ruamel.yaml import YAML


class ParameterNotFound(Exception):
    def __init__(self, name, path):
        message = "No Parameter with Name {} found in {}".format(name, path)
        super().__init__(message)


def rewrite(spec, name, value):
    updated = False

    for parameter in spec.get("Parameters"):
        if parameter.get("Name") == name:
            parameter.insert(2, "Value", value)
            updated = True

    if updated:
        return spec

    return None


def main(path, name, value):
    with open(path, "r") as h:
        contents = h.read()

    yaml = YAML()
    yaml.indent(mapping=2, sequence=4, offset=2)
    spec = yaml.load(contents)
    spec = rewrite(spec, name, value)

    if not spec:
        raise ParameterNotFound(name, path)

    with open(path, "w") as h:
        yaml.dump(spec, h)
