#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath="benherman/bostonhousing"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy bostonhousing --image=$dockerpath:latest


# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
podname=$(kubectl get pods | awk '{w=$1} END{print w}') 
kubectl port-forward pod/$podname --address 0.0.0.0 8000:80
