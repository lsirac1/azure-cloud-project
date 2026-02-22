#!/bin/bash
# List all resources in the project

echo "=== Resource Groups ==="
az group list --query "[?contains(name, 'rg-azure') || contains(name, 'rg-jump')]" -o table

echo "=== Resources in rg-azure-project ==="
az resource list --resource-group rg-azure-project -o table

echo "=== Resources in rg-jump-vm ==="
az resource list --resource-group rg-jump-vm -o table
