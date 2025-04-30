#!/bin/bash
set -e

echo "Waiting for pods to be ready..."
kubectl rollout status deployment/otel-demo --timeout=90s

echo "Testing app health endpoint..."
kubectl port-forward svc/otel-demo 8080:80 &
sleep 5
curl -f http://localhost:8080/health || exit 1

