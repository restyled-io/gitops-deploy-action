It clones and updates Parameters by name

  $ docker run --rm restyled/gitops-deploy-action \
  >   RestyledImage \
  >   restyled/restyled.io:acb123 \
  >   "Restyled Commits" \
  >   commits@restyled.io \
  >   restyled-io/ops \
  >   "cg-app/stacks/*/*/prod/services/sync-marketplace.yaml" \
  >   0 2> >(grep -Ev '^(Cloning|No Parameter)' >&2) | grep -E '^(-|\+)'
  --- a/cg-app/stacks/*/us-east-1/prod/services/sync-marketplace.yaml (glob)
  +++ b/cg-app/stacks/*/us-east-1/prod/services/sync-marketplace.yaml (glob)
  -    Value: restyled/restyled.io:* (glob)
  +    Value: restyled/restyled.io:acb123

It does not error as long as some stacks are updated

  $ docker run --rm restyled/gitops-deploy-action \
  >   RestyledImage \
  >   restyled/restyled.io:acb123 \
  >   "Restyled Commits" \
  >   commits@restyled.io \
  >   restyled-io/ops \
  >   "cg-app/stacks/*/*/prod/services/sync-marketplace.yaml" \
  >   0 2> >(grep -Ev '^(Cloning|No Parameter)' >&2) | grep -E '^(-|\+)'
  --- a/cg-app/stacks/*/us-east-1/prod/services/sync-marketplace.yaml (glob)
  +++ b/cg-app/stacks/*/us-east-1/prod/services/sync-marketplace.yaml (glob)
  -    Value: restyled/restyled.io:* (glob)
  +    Value: restyled/restyled.io:acb123

It errors when stacks are wrong

  $ docker run --rm restyled/gitops-deploy-action \
  >   RestylerImage \
  >   restyled/restyler:acb123 \
  >   "Restyled Commits" \
  >   commits@restyled.io \
  >   restyled-io/ops \
  >   "i/dont/*/*/exist" \
  >   0
  Cloning into '*'... (glob)
  => RestylerImage=restyled/restyler:acb123 in i/dont/*/*/exist
  [Errno 2] No such file or directory: 'i/dont/*/*/exist'
  No Parameters updated
  [1]

It errors when Parameter is not found

  $ docker run --rm restyled/gitops-deploy-action \
  >   RestylerImage \
  >   restyled/restyler:acb123 \
  >   "Restyled Commits" \
  >   commits@restyled.io \
  >   restyled-io/ops \
  >   "cg-app/stacks/*/*/sites/blog.yaml" \
  >   0
  Cloning into '*'... (glob)
  => RestylerImage=restyled/restyler:acb123 in cg-app/stacks/*/sites/blog.yaml (glob)
  No Parameter with Name RestylerImage found in cg-app/stacks/*/sites/blog.yaml (glob)
  No Parameters updated
  [1]
