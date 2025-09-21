#!/bin/bash

. demo-magic.sh
TYPE_SPEED=30
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"
clear

pe 'kubectl get namespace'
pe 'yq . < appli-ns.yaml'
pe 'kubectl create -f appli-ns.yaml'
pe 'kubectl get namespace'

pe 'yq . < appli-pod-latest.yaml'
pe 'kubectl create -f appli-pod-latest.yaml'
pe 'kubectl get pods -n appli --watch'
pe ''

clear
echo ""
echo "Nettoyage"
echo ""
pe 'kubectl delete -f appli-pod-latest.yaml'
pe 'kubectl get pods -n appli'
pe ''

clear
echo ""
echo "Ajoutons une policy"
echo ""
pe 'yq . < kyv-pol-disable-latest.yaml'
pe 'kubectl create -f kyv-pol-disable-latest.yaml'
pe 'kubectl get clusterpolicy'

pe 'kubectl create -f appli-pod-latest.yaml'
pe 'kubectl get pods -n appli'
pe ''

clear
echo ""
echo "Créons une application avec version"
pe 'yq . < appli-pod-version.yaml'
pe 'kubectl create -f appli-pod-version.yaml'
pe 'kubectl get pods -n appli --watch'
pe ''

clear
echo '💡Bonus 😍'
pe 'yq . < appli-deployment-version.yaml'
pe 'kubectl create -f appli-deployment-version.yaml'
pe 'kubectl get clusterpolicy disallow-latest-tag -o yaml | yq .'
pe 'kubectl describe clusterpolicy disallow-latest-tag'

exit

