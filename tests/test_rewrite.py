import unittest

from ruamel.yaml import YAML
import set_stack_parameter


class TestMain(unittest.TestCase):
    def test_main(self):
        yaml = YAML()
        path = "tests/files/example.yaml"
        expected = [{"Name": "Foo", "Value": "Quix"}, {"Name": "Baz", "Value": "Bat"}]

        with open(path, "r") as h:
            contents = h.read()

        spec = yaml.load(contents)
        spec = set_stack_parameter.rewrite(spec, "Foo", "Quix")

        self.assertEqual(spec["Parameters"], expected)


if __name__ == "__main__":
    unittest.main()
