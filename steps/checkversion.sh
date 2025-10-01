#!/bin/bash

clear
#sw_vers
#system_profiler SPSoftwareDataType

echo -n "Macos version "
sw_vers -productVersion

colima version | grep colima

minikube version | grep minikube

echo -n "kubectl version " 
kubectl version | grep Client | awk -F: '{print $2}'

echo -n "kubernetes version " 
kubectl version | grep Server | awk -F: '{print $2}'

