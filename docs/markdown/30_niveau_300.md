
<!-- .slide: class="flex-row center" data-background="./assets/volcamp/bkgnd-main2.png"-->
## Niveau 300 : Une demande du CISO vient de tomber...
![h600](./assets/volcamp/100-chateau-600.png)

Il faut sécuriser les containers dans le cluster !

##==##
<!-- .slide: class="flex-row center blue" data-background="./assets/volcamp/bkgnd-main2.png"-->
## Commencer par la base, de façon fiable et maîtrisée

### Documentation Kubernetes -> Pod Security Standards

- interdiction de tourner sous l'indentité root
- filesystem / en lecture seule
- isolation des "namespaces" de la machine hôte (PID, IPC, Network, HostAlias,...)
- desactivation de toutes les capabilities (CAP_NET_RAW, CAP_SYS_ADMIN, ...)
- interdiction des escalations de privilege
<BR>
<BR>
<BR>
https://kubernetes.io/docs/concepts/security/pod-security-standards


##==##
<!-- .slide: class="flex-row center" data-background="./assets/volcamp/bkgnd-main2.png"-->
## Pod Security Standards
![h500](./assets/volcamp/pss-700.png)


##==##
<!-- .slide: class="flex-row center" data-background="./assets/volcamp/bkgnd-main2.png"-->
## Le repo helm kyverno offre un chart kyverno-policies

Choix du profil : 
![h500](./assets/volcamp/policies-baseline.jpg)

Mode : Audit ou Enforce
![h500](./assets/volcamp/policies-enforce.jpg)

##==##
<!-- .slide: class="flex-row center" data-background="./assets/volcamp/bkgnd-main2.png"-->
## Utilisons le helm chart kyverno-policies
![h-600](./assets/volcamp/demo-time-girl.png)

