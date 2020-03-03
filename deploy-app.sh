#!/bin/bash

#### Deploying the Applucation 


#### Deploy the Run Comtroller
echo "Deploying the Run Controller"
kubectl apply -f run-controller/deployment.yaml

echo "Deploy Services for run-controller"
kubectl apply -f run-controller/service.yaml


#### Deploying Backend Gateway


echo "Deploying the Backend Gateway"

kubectl apply -f workout-gateway/deployment.yaml

echo "Deploying Services for Backend gateway"
kubectl apply -f workout-gateway/service.yaml


###### Deploying Front-End App

echo "Deploying the front-end APP"
kubectl apply -f front/deployment.yaml

echo "Deploying Services for Front-end App"
kubectl apply -f front/service.yaml

######

echo "Forwarding the Expose Ports for Services"
echo "Forward port 3000"
kubectl port-forward service/front-end 3000:3000 &
echo "Forward port 8000"
kubectl port-forward service/workout-gateway 8000:8000 &

