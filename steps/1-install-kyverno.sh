#!/bin/bash

. demo-magic.sh
TYPE_SPEED=35
DEMO_PROMPT="\$ "
clear

pe 'helm repo add kyverno https://kyverno.github.io/kyverno/'
pe 'helm repo update'
pe 'helm install kyverno kyverno/kyverno -n kyverno --create-namespace'

pe 'kubectl get namespaces'
pe 'kubectl get deployment -n kyverno'
pe 'kubectl get pods -n kyverno'

exit

