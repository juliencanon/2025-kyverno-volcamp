#!/bin/bash

. demo-magic.sh
clear

TYPE_SPEED=30
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"

echo ""
pe 'yq . < gen-netpol-policy.yaml'
echo ""
pe 'kubectl create -f gen-netpol-policy.yaml'
echo ""

pe 'yq . < gen-quota-policy.yaml'
echo ""
pe 'kubectl create -f gen-quota-policy.yaml'
echo ""

pe 'kubectl get clusterpolicy'
echo ""

pe 'yq . < gen-demo-ns.yaml'
echo ""
pe 'kubectl create -f gen-demo-ns.yaml'
echo ""
pe 'kubectl get namespace'
echo ""
pe 'kubectl get NetworkPolicy -n gen-demo'
echo ""
pe 'kubectl get NetworkPolicy -n gen-demo -o yaml | yq .'
echo ""
pe 'kubectl get quota -n gen-demo'
echo ""

exit

