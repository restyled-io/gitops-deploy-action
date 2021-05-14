It clones and updates Parameters by name

  $ docker run --rm -e GITHUB_TOKEN restyled/gitops-deploy-action \
  >   RestylerImage \
  >   restyled/restyler:acb123 \
  >   "Restyled Commits" \
  >   commits@restyled.io \
  >   restyled-io/ops \
  >   "\
  >   cg-app/stacks/*/*/prod-webhooks.yaml\
  >   cg-app/stacks/*/*/prod-sync-marketplace.yaml\
  > " \
  >   0
  Cloning into '*'... (glob)
  => RestylerImage=restyled/restyler:acb123 in cg-app/stacks/*/prod-webhooks.yaml (glob)
  => RestylerImage=restyled/restyler:acb123 in cg-app/stacks/*/prod-sync-marketplace.yaml (glob)
  [main *] Automated update of RestylerImage (glob)
   2 files changed, 2 insertions(+), 2 deletions(-)
  commit * (glob)
  Author: Restyled Commits <commits@restyled.io>
  Date:   * (glob)
  
      Automated update of RestylerImage
  
  diff --git * (glob)
  index * (glob)
  --- a/* (glob)
  +++ b/* (glob)
  @@ * @@ Parameters: (glob)
     - Name: RestyledImage
       Value: * (glob)
     - Name: RestylerImage
  -    Value: restyled/restyler:* (glob)
  +    Value: restyled/restyler:acb123
   
     - Name: Version
       Value: 1
  diff --git * (glob)
  index * (glob)
  --- a/* (glob)
  +++ b/* (glob)
  @@ * @@ Parameters: (glob)
     - Name: RestyledImage
       Value: * (glob)
     - Name: RestylerImage
  -    Value: restyled/restyler:* (glob)
  +    Value: restyled/restyler:acb123
   
     - Name: Version
       Value: 1
  Refusing to push (-D given)
