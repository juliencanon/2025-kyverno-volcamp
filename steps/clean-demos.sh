#!/bin/bash

kubectl delete -f 2-demo-first-pol/appli-ns.yaml
kubectl delete ns gen-demo
kubectl delete ns mut-demo
kubectl delete -f 2-demo-first-pol/kyv-pol-disable-latest.yaml

kubectl delete -f 3-demo-mutate/mut-ns-policy.yaml
kubectl delete -f 3-demo-mutate/mut-deploy-inject-policy.yaml
kubectl delete -f 3-demo-mutate/mut-pod-policy.yaml
kubectl delete -f 3-demo-mutate/nginx-deployment-version.yaml
kubectl delete -f 3-demo-mutate/mut-demo-ns.yaml

kubectl delete -f 4-demo-generate/gen-netpol-policy.yaml
kubectl delete -f 4-demo-generate/gen-quota-policy.yaml
kubectl delete -f 4-demo-generate/gen-demo-ns.yaml

helm uninstall kyverno-policies -n kyverno
kubectl get clusterpolicy

