<!-- .slide: class="flex-row center" data-background="./assets/lunch/bkgnd-lunch.png"-->
### Pré-requis : Connaissance de l'écosystème Kubernetes
![h-600](./assets/techready/illus-cluster-2.png)

##==##
<!-- .slide: class="flex-row center" data-background="./assets/lunch/bkgnd-lunch.png"-->
### Retour d'expérience
![h-700](./assets/techready/arrivee-client.png)

##==##
<!-- .slide: class="flex-row center" data-background="./assets/lunch/bkgnd-lunch.png"-->
### Equipe mature appliquant les bonnes pratiques
![h-700](./assets/techready/team-mature.png)
![h-700](./assets/lunch/outils-trans3.png)

##==##
<!-- .slide: class="flex-row center" data-background="./assets/lunch/bkgnd-lunch.png"-->
![h-700](./assets/techready/arrivee_client.png)
Notes: 
- arrivée d'un junior dans l'entreprise
- des resources utilisent des api deprecated (or elles vont être removes)
- il reste plein de secrets obsoletes
- ce à quoi on n'en pas pensé en amont
- pas comme du bon vin, 

##==##
<!-- .slide: data-background="./assets/lunch/bkgnd-lunch.png"-->
### Sources de problèmes
![h-600 center](./assets/lunch/nuage-de-mots-issues.png)
Notes:
#### L'entropie du système augmente...
- La définition des requests/limits manquent pour le CPU et la RAM
- Il est difficile de savoir à qui appartient telle ou telle application
- Les containers ne sont pas sécurisés (possibilité d'évasion)
- Les images proviennent de diverses registries, parfois obscures
- Une nomenclature serait la bienvenue
https://nuagedemots.co/
requests limits tags owner Securitycontext privileged network registries supply trust attestation supply tags tags requests limits cpu memory PDB namespaces policy

