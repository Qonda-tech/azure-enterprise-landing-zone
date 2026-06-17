# Azure Enterprise Landing Zone – Deployment Guide

## Overview

This project demonstrates the deployment and management of a secure Azure Enterprise Landing Zone using Microsoft Azure and Terraform. The environment was built to showcase practical Azure Administrator (AZ-104) skills, including networking, security, monitoring, backup and recovery, governance, and Infrastructure as Code (IaC).

---

## Solution Components

### Core Infrastructure
- Resource Group: RG-ENTERPRISE-PROD
- Virtual Network: vnet-enterprise-prod
- Application Subnet: app-subnet
- Azure Bastion Subnet: AzureBastionSubnet

### Security
- Network Security Group (NSG)
- Azure Role-Based Access Control (RBAC)
- Azure Policy Governance

### Monitoring
- Azure Monitor
- Log Analytics Workspace
- VM Insights
- Action Groups
- CPU Alert Rules
- Data Collection Rules (DCR)

### Backup & Recovery
- Recovery Services Vault
- VM Backup Policy
- Backup Retention Configuration

### Infrastructure as Code
- Terraform AzureRM Provider
- Terraform State Management
- Resource Import Operations
- Drift Detection

---

# Prerequisites

Ensure the following tools are installed before deployment:

| Requirement | Purpose |
|------------|----------|
| Azure Subscription | Azure Resources |
| Azure CLI | Azure Authentication |
| Terraform | Infrastructure Deployment |
| Git | Source Control |
| Azure Portal Access | Resource Validation |

Verify installations:

```powershell
terraform version
git version
az version
```

Verify Azure authentication:

```powershell
az login
az account show
```

---

# Repository Structure

```text
azure-enterprise-landing-zone/
├── terraform/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   └── outputs.tf
├── scripts/
├── diagrams/
├── docs/
├── screenshots/
└── README.md
```

---

# Deployment Process

## Step 1: Clone Repository

```powershell
git clone https://github.com/<your-github-username>/azure-enterprise-landing-zone.git
cd azure-enterprise-landing-zone
```

## Step 2: Authenticate to Azure

```powershell
az login
az account show
```

Verify the correct subscription is selected before deployment.

## Step 3: Navigate to Terraform Directory

```powershell
cd terraform
```

## Step 4: Initialize Terraform

```powershell
terraform init
```

Expected result:

```text
Terraform has been successfully initialized.
```

## Step 5: Validate Configuration

```powershell
terraform validate
```

Expected result:

```text
Success! The configuration is valid.
```

## Step 6: Review Deployment Plan

```powershell
terraform plan
```

Terraform compares the Azure environment against the Terraform configuration and displays planned changes.

## Step 7: Deploy Infrastructure

```powershell
terraform apply
```

Approve deployment when prompted:

```text
yes
```

Terraform will create or update Azure resources.

---

# Post-Deployment Validation

## Validate Resource Group

```powershell
az group show --name RG-ENTERPRISE-PROD
```

## Validate Virtual Network

```powershell
az network vnet show `
--resource-group RG-ENTERPRISE-PROD `
--name vnet-enterprise-prod
```

## Validate Log Analytics Workspace

Navigate to:

Azure Portal → Log Analytics Workspaces → law-enterprise-prod

Confirm:
- Workspace Status = Active
- Workspace successfully created
- Monitoring data is being collected

## Validate VM Insights

Navigate to:

Azure Monitor → Insights → Virtual Machines

Confirm:
- VM is visible
- Performance metrics are collected

## Validate Alert Rule

Navigate to:

Azure Monitor → Alerts → Alert Rules

Verify the following alert exists:

```text
alert-vm-admin01-high-cpu
```

## Validate Backup Configuration

Navigate to:

Recovery Services Vaults → rsv-enterprise-prod

Verify:
- Backup Policy exists
- Backup schedule configured
- Retention policy configured

---

# Terraform State Validation

Verify all deployed resources are tracked by Terraform:

```powershell
terraform state list
```

Expected resources include:

```text
azurerm_resource_group.enterprise
azurerm_virtual_network.enterprise
azurerm_subnet.app
azurerm_subnet.bastion
azurerm_network_security_group.web
azurerm_log_analytics_workspace.enterprise
azurerm_monitor_action_group.enterprise
azurerm_monitor_metric_alert.vm_cpu_high
azurerm_monitor_data_collection_rule.vm_insights
azurerm_monitor_data_collection_rule_association.vm_admin01
azurerm_recovery_services_vault.enterprise
azurerm_backup_policy_vm.daily
```

---

# Drift Detection

Terraform can be used to detect configuration drift.

Run:

```powershell
terraform plan
```

Expected result:

```text
No changes. Infrastructure matches configuration.
```

This confirms the deployed Azure environment remains synchronized with the Terraform configuration.

---

# Project Outcome

This project successfully demonstrates:

- Azure Resource Deployment
- Azure Networking
- RBAC and Governance
- Monitoring and Alerting
- Log Analytics and VM Insights
- Backup and Recovery
- Infrastructure as Code (Terraform)
- Terraform State Management
- Drift Detection
- Enterprise Cloud Administration Best Practices

The solution provides a secure, monitored, recoverable, and repeatable Azure environment aligned with Microsoft Azure Administrator (AZ-104) objectives and enterprise operational standards.