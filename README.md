# Gitops Deploy Action

Commit a Parameter change in a separate gitops repository.

## Background

Restyled uses [GitOps][] for managing the entirety of its infrastructure. This
means the state of all running services is captured in a [git repository][ops].
Therefore, deploying a new version of an application means committing a change
of parameter to that repository (which is then auto-deployed). This Action
allows individual applications to easily perform that update as part of their
CI/CD flow.


[gitops]: https://www.weave.works/blog/what-is-gitops-really
[ops]: https://github.com/restyled-io/ops

## Usage

```yaml
- uses: restyled-io/gitops-deploy-action@main
  with:
    token: ${{ secrets.GITOPS_REPOSITORY_TOKEN }}
    parameter-name: SomeParameter
    parameter-value: SomeValue
    committer-name: Some Name
    committer-email: some@email.com
    repository: your/gitops-repo
    stacks: |
      stacks/*/*/this.yaml
      stacks/*/*/that.yaml
```

## Inputs

- `token`: access token with commit writes to the gitops repository
- `parameter-name`: name of Parameter to update
- `parameter-value`: value to set the Parameter to
- `committer-name`: name to use for commit
- `committer-email`: email to use for commit
- `repository`: full name of your gitops repository
- `stacks`: paths or globs, separated by newline, of stack definitions to update
  the Parameter in
- `push`: set to `0` to not actually push the commit, default is `1`

## Outputs

None.

---

[LICENSE](./LICENSE) | [CHANGELOG](./CHANGELOG.md)
