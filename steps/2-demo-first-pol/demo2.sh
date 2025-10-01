#!/bin/bash

. demo-magic.sh 
TYPE_SPEED=30
DEMO_PROMPT="\$ "
clear

echo ""
echo "Etat des lieux initial"
echo ""
pe 'kubectl get namespace'
echo ""
pe 'yq . < appli-ns.yaml'
echo ""
pe 'kubectl create -f appli-ns.yaml'
echo ""
pe 'kubectl get namespace'
echo ""

pe 'yq . < appli-pod-latest.yaml'
echo ""
pe 'kubectl create -f appli-pod-latest.yaml'
echo ""
pe 'kubectl get pods -n appli'
echo ""
pe ''

clear
echo ""
echo "Nettoyage"
echo ""
pe 'kubectl delete -f appli-pod-latest.yaml'
echo ""
pe 'kubectl get pods -n appli'
pe ''

clear
echo ""
echo "Ajoutons une policy"
echo ""
pe 'yq . < kyv-pol-disable-latest.yaml'
pe 'kubectl create -f kyv-pol-disable-latest.yaml'
echo ""
pe 'kubectl get clusterpolicy'
echo ""

pe 'kubectl create -f appli-pod-latest.yaml'
echo ""
pe 'kubectl get pods -n appli'
echo ""
pe ''

clear
echo ""
echo "Créons une application avec version"
echo ""
pe 'yq . < appli-pod-version.yaml'
echo ""
pe 'kubectl create -f appli-pod-version.yaml'
echo ""
pe 'kubectl get pods -n appli'
echo ""
pe ''

clear
echo ""
echo '💡Bonus 😍'
echo ""
pe 'yq . < appli-deployment-version.yaml'
echo ""
pe 'kubectl create -f appli-deployment-version.yaml'
echo ""
pe 'kubectl get clusterpolicy disallow-latest-tag -o yaml | yq .'
echo ""
pe 'kubectl get clusterpolicy disallow-latest-tag -o yaml | yq .spec.rules'
echo ""
pe "kubectl get clusterpolicy disallow-latest-tag -o yaml | yq '.status.autogen.rules[0]'"
echo ""
pe "kubectl get clusterpolicy disallow-latest-tag -o yaml | yq '.status.autogen.rules[1]'"
echo ""
pe "kubectl get clusterpolicy disallow-latest-tag -o yaml | yq '.status.autogen.rules[2]'"
echo ""
pe "kubectl get clusterpolicy disallow-latest-tag -o yaml | yq '.status.autogen.rules[3]'"
echo ""
pe 'kubectl get clusterpolicy disallow-latest-tag -o yaml | yq .status.rulecount'
echo ""
pe 'kubectl describe clusterpolicy disallow-latest-tag'
echo ""

exit

