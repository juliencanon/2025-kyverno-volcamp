
<!-- .slide: class="flex-row center" data-background="./assets/volcamp/bkgnd-main2.png"-->
## Sécuriser la supply chain
![h-600](./assets/volcamp/origine-image.png)

##==##

<!-- .slide: class="with-code-dark max-height" data-background="./assets/volcamp/bkgnd-main2.png"-->
### S'assurer que les images proviennent de registries sûres
```yaml [2,4,14-23]
apiVersion: kyverno.io/v1
kind: ClusterPolicy
metadata:
  name: restrict-image-registries
spec:
  validationFailureAction: Enforce
  rules:
  - name: validate-registries
    match:
      any:
      - resources:
          kinds:
          - Pod
    validate:
      message: "Unknown image registry."
      pattern:
        spec:
          =(ephemeralContainers):
          - image: "secure.registry.com/* | registry.enterprise.io/*"
          =(initContainers):
          - image: "secure.registry.com/* | registry.enterprise.io/*"
          containers:
          - image: "secure.registry.com/* | registry.enterprise.io/*"
```

##==##
<!-- .slide: class="with-code-dark max-height" data-background="./assets/volcamp/bkgnd-main2.png"-->
## Vérification du contenu (SBOM) et des signatures (Notary)

```yaml [2,4,12-15,19-22]
apiVersion: policies.kyverno.io/v1alpha1
kind: ImageValidatingPolicy
metadata:
  name: check-images
spec:
  matchConstraints:
    resourceRules:
      - resources: ["pods"]
  matchImageReferences:
    - glob: ghcr.io/*
      attestors:
        - name: notary
          notary:
            certs:
              value: |-
                  -----BEGIN CERTIFICATE-----
                  ...
                  -----END CERTIFICATE-----
      attestations:
        - name: sbom
          referrer:
            type: sbom/cyclone-dx
```

##==##
<!-- .slide: class="with-code-dark max-height" data-background="./assets/volcamp/bkgnd-main2.png"-->
## Vérification du contenu (SBOM) et des signatures (Notary)

```yaml [4,8,11]
  validations:
    - expression: >-
        images.containers.map(image, verifyImageSignatures(image, [attestors.notary])).all(e, e > 0)
      message: failed to verify image with notary cert
    - expression: >-
        images.containers.map(image, verifyAttestationSignatures(image, 
           attestations.sbom, [attestors.notary])).all(e, e > 0)
      message: failed to verify attestation with notary cert
    - expression: >-
        images.containers.map(image, extractPayload(image, attestations.sbom).bomFormat == 'CycloneDX').all(e, e)
      message: sbom is not a cyclone dx sbom
```

