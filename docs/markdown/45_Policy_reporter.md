
<!-- .slide: class="flex-row center" data-background="./assets/volcamp/bkgnd-basew.png"-->
## Policy-reporter
![h-800](./assets/techready/policy-reporter.png)

##==##
<!-- .slide: class="with-code-dark max-height" data-background="./assets/volcamp/bkgnd-basew.png"-->
## PolicyExceptions (Pouvoir gérer une exception ponctuelle)
```yaml
apiVersion: kyverno.io/v2
kind: PolicyException
metadata:
  name: delta-exception
  namespace: delta
spec:
  exceptions:
  - policyName: disallow-host-namespaces
    ruleNames:
    - host-namespaces
    - autogen-host-namespaces
  match:
    any:
    - resources:
        kinds:
        - Pod
        - Deployment
        namespaces:
        - delta
        names:
        - important-tool*
```


