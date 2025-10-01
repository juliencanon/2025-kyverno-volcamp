#!/bin/bash

. demo-magic.sh
TYPE_SPEED=35
DEMO_PROMPT="\$ "
clear

echo ""
echo "Etat des lieux initial"
echo ""
pe 'kubectl get nodes'
echo ""
pe 'kubectl get namespace'
echo ""

pe 'helm repo add kyverno https://kyverno.github.io/kyverno/'
echo ""
pe 'helm repo update'
echo ""
pe 'helm install kyverno kyverno/kyverno -n kyverno --create-namespace'

pe 'kubectl get namespaces'
echo ""
pe 'kubectl get deployment -n kyverno'
echo ""
pe 'kubectl get pods -n kyverno'
echo ""

exit

