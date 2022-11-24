#!/usr/bin/env bash
  echo "####################################################################################################"
  echo "# Step 1 - Un-Deployment of Application Components"
  echo "####################################################################################################"
  echo ""

  echo "Step 1.1 Un-deploy ui"  
  kubectl delete namespace backend || true

  echo "Step 1.2 Un-deploy broker"  
  kubectl delete namespace day2-operations || true

  echo "Step 1.3 Un-deploy Approuter"  
 kubectl delete namespace frontend || true

  echo "Step 1.4 Un-deploy Backend"  
  kubectl delete namespace integration || true
  
  echo "Step 1.5 Un-deploy day2-approuter"  
  kubectl delete namespace  mock || true

   
  
  echo
  echo "####################################################################################################"
  echo "# Un-Deployment Successful"
  echo "####################################################################################################"
  
