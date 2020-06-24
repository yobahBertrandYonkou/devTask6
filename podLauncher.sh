#!/bin/bash

status=$(sudo kubectl get deployments my-dep) #searches for deployment
status=$? # assigns 1 ti status if pod not found

case $status in
              0)
              echo "Deployment online"
              exit 0
              ;;
            esac 
             
              

status=$(sudo kubectl get pvc web-pvc) #searches for pvx
status=$? # assigns 1 ti status if pvc not found

case $status in 
      1)
      echo "Claiming Storage..."
      sudo kubectl create -f web-pvc.yml
      echo "creating svc..."
      sudo kubectl create -f test-svc.yml
      echo "All done!"
      ;;
      0)
      echo "PVC and SVC running..."
      ;;
   esac



status=$(sudo [ -f './index.html' ])
status=$?

case  $status  in
              
   0)
   echo "html code detected"
   echo "launching html server..."
   sudo kubectl create -f html-Deployment-test.yml
   echo "exposing server..."
   sudo kubectl expose deployment my-dep --port 80 --type=NodePort
   echo "EXPOSED!!!"
              ;;
    1)
   echo "php code detected"
   echo "launching php server..."
   sudo kubectl create -f php-Deployment-test.yml
   echo "exposing server..."   
   sudo kubectl expose deployment my-dep --port 80 --type=NodePort
   echo "EXPOSED!!!"
              ;;
    esac
