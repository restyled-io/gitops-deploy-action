# Gitops Deploy Action

Commit a Parameter change in a separate gitops repository.

## Background

TODO

## Usage

```yaml
- uses: restyled-io/gitops-deploy-action@main
  with:
    token: ${{ secrets.GITOPS_REPOSITORY_TOKEN }}
    parameter-name: SomeParameter
    parameter-value: SameValue
    committer-name: Some Name
    committer-email: some@email.com
    repository: your/gitops-repo
    stacks: |
      stacks/*/*/this.yaml
      stacks/*/*/that.yaml
```

## Inputs

TODO

---

[LICENSE](./LICENSE) | [CHANGELOG](./CHANGELOG.md)
