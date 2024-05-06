import unittest

from ruamel.yaml import YAML
import set_stack_parameter

example = set_stack_parameter.yaml_load("tests/files/example.yaml")
example_kv = set_stack_parameter.yaml_load("tests/files/example-kv.yaml")


class TestRewrite(unittest.TestCase):
    def test_rewrite(self):
        spec = set_stack_parameter.rewrite(example, "Foo", "Quix")

        self.assertEqual(
            spec["Parameters"],
            [{"Name": "Foo", "Value": "Quix"}, {"Name": "Baz", "Value": "Bat"}],
        )

    def test_rewrite_noop(self):
        spec = set_stack_parameter.rewrite(example, "NotPresent", "xxx")

        self.assertIsNone(spec)

    def test_rewrite_kv(self):
        spec = set_stack_parameter.rewrite(example_kv, "Foo", "Quix")

        self.assertEqual(spec["Parameters"], {"Foo": "Quix", "Baz": "Bat"})

    def test_rewrite_kv_noop(self):
        spec = set_stack_parameter.rewrite(example_kv, "NotPresent", "xxx")

        self.assertIsNone(spec)


if __name__ == "__main__":
    unittest.main()
