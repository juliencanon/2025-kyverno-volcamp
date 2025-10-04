
<!-- .slide: class="flex-row center" data-background="./assets/volcamp/bkgnd-main2.png"-->
## Contexte Kubernetes
![h-500](./assets/volcamp/k8s-logo-trans.png)
![h-500](./assets/volcamp/illus-cluster-2.png)

##==##
<!-- .slide: class="flex-row center" data-background="./assets/volcamp/bkgnd-main2.png"-->
![h-700](./assets/volcamp/arrivee-client.png)

##==##
<!-- .slide: class="flex-row center" data-background="./assets/volcamp/bkgnd-main2.png"-->
![h-700](./assets/volcamp/team-mature.png)
![h-700](./assets/volcamp/outils-trans3.png)

##==##
<!-- .slide: class="flex-row center" data-background="./assets/volcamp/bkgnd-main2.png"-->
## L'entropie du système augmente...
![h-600](./assets/volcamp/arrivee_client.png)
Notes: 
- arrivée d'un junior dans l'entreprise
- il reste plein de secrets obsoletes
- ce à quoi on n'en pas pensé en amont

##==##
<!-- .slide: data-background="./assets/volcamp/bkgnd-main2.png"-->
## Sources de problèmes
- La définition des requests/limits manquent, scheduling pas optimal
- Il est difficile de savoir le propriétaire de certaines resources
- Les resources utilisent des apiVersions vieillissantes
- Les containers ne sont pas sécurisés (possibilité d'évasion)
- Les images proviennent de diverses registries, parfois obscures
- Il reste des resources oubliées lors de décommissionnement
- Le nommage laisse à désirer
- Tout autre grain de sable dont on n'a pas encore pris conscience...
<!-- .element: class="list-fragment" -->

##==##
<!-- .slide: class="flex-row center" data-background="./assets/volcamp/bkgnd-main2.png"-->
## Comment Kyverno nous aide-t-il ?
![h-500](./assets/volcamp/kyverno2.png)
![h-500](./assets/volcamp/Question_mark_alternate.svg)
