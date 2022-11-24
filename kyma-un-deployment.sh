#!/usr/bin/env bash
  echo "####################################################################################################"
  echo "# Step 1 - Un-Deployment of Application Components"
  echo "####################################################################################################"
  echo ""

  echo "Step 1.1 delete namespace backend"  
  kubectl delete namespace backend || true

  echo "Step 1.2 delete namespace day2-operations"  
  kubectl delete namespace day2-operations || true

  echo "Step delete namespace frontend"  
 kubectl delete namespace frontend || true

  echo "Step 1.4 delete namespace integration"  
  kubectl delete namespace integration || true
  
  echo "Step 1.5 delete namespace  mock"  
  kubectl delete namespace  mock || true

   
  
  echo
  echo "####################################################################################################"
  echo "# Un-Deployment Successful"
  echo "####################################################################################################"
  
