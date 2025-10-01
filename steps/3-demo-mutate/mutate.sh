#!/bin/bash

. demo-magic.sh
clear

TYPE_SPEED=30
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"

echo ""
pe 'yq . < mut-ns-policy.yaml'
echo ""
pe 'kubectl create -f mut-ns-policy.yaml'
echo ""

pe 'yq . < mut-deploy-inject-policy.yaml'
echo ""
pe 'kubectl create -f mut-deploy-inject-policy.yaml'
echo ""

pe 'yq . < mut-pod-policy.yaml'
echo ""
pe 'kubectl create -f mut-pod-policy.yaml'
echo ""

pe 'kubectl get clusterpolicy'
echo ""

pe 'yq . < mut-demo-ns.yaml'
echo ""
pe 'kubectl create -f mut-demo-ns.yaml'
echo ""
pe 'kubectl get namespace'
echo ""
pe 'kubectl get namespace mut-demo -o yaml | yq .'
echo ""

pe 'yq . < nginx-deployment-version.yaml'
echo ""
pe 'kubectl create -f nginx-deployment-version.yaml'
echo ""
pe 'kubectl get deploy -n mut-demo'
echo ""
pe 'kubectl get deploy -n mut-demo -o yaml | yq .'

exit

