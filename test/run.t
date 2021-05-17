It clones and updates Parameters by name

  $ docker run --rm restyled/gitops-deploy-action \
  >   RestylerImage \
  >   restyled/restyler:acb123 \
  >   "Restyled Commits" \
  >   commits@restyled.io \
  >   restyled-io/ops \
  >   "\
  >   cg-app/stacks/*/*/prod-webhooks.yaml\
  >   cg-app/stacks/*/*/prod-sync-marketplace.yaml\
  > " \
  >   0 | grep -E '^(-|\+)'
  Cloning into '*'... (glob)
  --- a/cg-app/stacks/*/us-east-1/prod-sync-marketplace.yaml (glob)
  +++ b/cg-app/stacks/*/us-east-1/prod-sync-marketplace.yaml (glob)
  -    Value: restyled/restyler:* (glob)
  +    Value: restyled/restyler:acb123
  --- a/cg-app/stacks/*/us-east-1/prod-webhooks.yaml (glob)
  +++ b/cg-app/stacks/*/us-east-1/prod-webhooks.yaml (glob)
  -    Value: restyled/restyler:* (glob)
  +    Value: restyled/restyler:acb123

It does not error as long as some stacks are updated

  $ docker run --rm restyled/gitops-deploy-action \
  >   RestylerImage \
  >   restyled/restyler:acb123 \
  >   "Restyled Commits" \
  >   commits@restyled.io \
  >   restyled-io/ops \
  >   " cg-app/stacks/**/*.yaml" \
  >   0 2>/dev/null | grep -E '^(-|\+)'
  --- a/cg-app/stacks/*/us-east-1/prod-sync-marketplace.yaml (glob)
  +++ b/cg-app/stacks/*/us-east-1/prod-sync-marketplace.yaml (glob)
  -    Value: restyled/restyler:* (glob)
  +    Value: restyled/restyler:acb123
  --- a/cg-app/stacks/*/us-east-1/prod-webhooks.yaml (glob)
  +++ b/cg-app/stacks/*/us-east-1/prod-webhooks.yaml (glob)
  -    Value: restyled/restyler:* (glob)
  +    Value: restyled/restyler:acb123

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
  No Parameters updated
  [1]

It errors when Parameter is not found

  $ docker run --rm restyled/gitops-deploy-action \
  >   RestylerImage \
  >   restyled/restyler:acb123 \
  >   "Restyled Commits" \
  >   commits@restyled.io \
  >   restyled-io/ops \
  >   "cg-app/stacks/*/*/prod-blog.yaml" \
  >   0
  Cloning into '*'... (glob)
  => RestylerImage=restyled/restyler:acb123 in cg-app/stacks/*/prod-blog.yaml (glob)
  No Parameter with Name RestylerImage found in cg-app/stacks/*/prod-blog.yaml (glob)
  No Parameters updated
  [1]
