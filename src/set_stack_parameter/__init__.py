from ruamel.yaml import YAML

yaml = YAML()
yaml.indent(mapping=2, sequence=4, offset=2)


class ParameterNotFound(Exception):
    def __init__(self, name, path):
        message = "No Parameter with Name {} found in {}".format(name, path)
        super().__init__(message)


def yaml_load(path):
    with open(path, "r") as h:
        contents = h.read()

    return yaml.load(contents)


def rewrite(spec, name, value):
    parameters = spec.get("Parameters")

    if isinstance(parameters, dict):
        # Using {Name: Value} syntax, just update it

        if parameters.get(name):
            parameters.update({name: value})
            spec.update({"Parameters": parameters})

            return spec

    else:
        # Using [{Name:,Value:}] syntax, find and update the correct element

        for parameter in parameters:
            if parameter.get("Name") == name:
                parameter.insert(2, "Value", value)

                return spec

    return None


def main(path, name, value):
    spec = rewrite(yaml_load(path), name, value)

    if not spec:
        raise ParameterNotFound(name, path)

    with open(path, "w") as h:
        yaml.dump(spec, h)
