#!/bin/bash

. demo-magic.sh
TYPE_SPEED=30
#DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"
DEMO_PROMPT="${PURPLE}➜ ${PURPLE}\W ${COLOR_RESET}"
cd yamls-demo-2
clear

pe 'kubectl get namespace'
pe 'yq . < appli-ns.yaml'
pe 'kubectl create -f appli-ns.yaml'
pe 'kubectl get namespace'

pe 'yq . < appli-pod-latest.yaml'
pe 'kubectl create -f appli-pod-latest.yaml'
#pe 'kubectl get pods -n appli --watch'
echo 'kubectl get pods -n appli --watch'
kubectl get pods -n appli
echo 'sleep 10'
sleep 10
kubectl get pods -n appli
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
echo ""
pe 'yq . < appli-pod-version.yaml'
pe 'kubectl create -f appli-pod-version.yaml'
#pe 'kubectl get pods -n appli --watch'
echo 'kubectl get pods -n appli --watch'
kubectl get pods -n appli
echo 'sleep 10'
sleep 10
kubectl get pods -n appli
pe ''

clear
echo '💡Bonus 😍'
echo ""
pe 'yq . < appli-deployment-version.yaml'
pe 'kubectl create -f appli-deployment-version.yaml'
pe 'kubectl get clusterpolicy disallow-latest-tag -o yaml | yq .'
pe 'kubectl describe clusterpolicy disallow-latest-tag'

exit

