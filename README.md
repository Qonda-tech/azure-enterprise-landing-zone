# Azure Enterprise Landing Zone (AZ-104 Portfolio Project)

## Overview

This project demonstrates the deployment and management of a secure Azure Enterprise Landing Zone using Microsoft Azure and Terraform.

The environment was designed to simulate a production-ready enterprise deployment while showcasing practical Azure Administrator (AZ-104) skills in networking, security, monitoring, backup and recovery, governance, and Infrastructure as Code (IaC).

---

## Project Goals

- Deploy Azure infrastructure using Terraform
- Implement secure networking and access controls
- Configure monitoring and alerting
- Enable backup and recovery services
- Apply governance and compliance controls
- Demonstrate Infrastructure as Code best practices
- Validate infrastructure through Terraform state management
- Simulate enterprise cloud administration operations

---

# Architecture Overview

## Core Infrastructure

| Component | Name |
|------------|------------|
| Resource Group | RG-ENTERPRISE-PROD |
| Virtual Network | vnet-enterprise-prod |
| Application Subnet | app-subnet |
| Bastion Subnet | AzureBastionSubnet |
| Network Security Group | nsg-web-prod |

---

## Identity & Access Management

- Azure Role-Based Access Control (RBAC)
- Least Privilege Access Model
- Contributor Role Assignment
- Azure IAM Management

---

## Monitoring & Logging

- Azure Monitor
- Log Analytics Workspace
- VM Insights
- Data Collection Rules (DCR)
- Data Collection Rule Associations (DCRA)
- Action Groups
- CPU Alert Rules

---

## Backup & Recovery

- Recovery Services Vault
- VM Backup Policy
- Daily Backup Schedule
- Backup Retention Configuration

---

## Governance & Compliance

- Azure Policy
- Resource Tagging Strategy
- Governance Controls
- Operational Compliance

---

## Infrastructure as Code

- Terraform AzureRM Provider
- Terraform Resource Imports
- Terraform State Management
- Drift Detection

---

# Technology Stack

| Technology | Purpose |
|------------|------------|
| Microsoft Azure | Cloud Platform |
| Terraform | Infrastructure as Code |
| Azure Monitor | Monitoring |
| Log Analytics | Centralized Logging |
| Recovery Services Vault | Backup & Recovery |
| Azure Policy | Governance |
| Azure RBAC | Identity Management |
| Azure Bastion | Secure VM Access |
| GitHub | Source Control |

---

# Project Structure

```text
azure-enterprise-landing-zone/
│
├── terraform/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── diagrams/
│
├── docs/
│   ├── Architecture-Overview.md
│   ├── Deployment-Guide.md
│   ├── Terraform-Implementation.md
│   ├── Monitoring-and-Backup.md
│   └── Lessons-Learned.md
│
├── scripts/
│
├── screenshots/
│   ├── 01-core-infrastructure/
│   ├── 02-identity-and-access-management/
│   ├── 03-cost-management/
│   ├── 04-monitoring-and-logging/
│   ├── 05-governance-and-compliance/
│   ├── 06-backup-and-recovery/
│   ├── 07-terraform/
│   └── 08-project-validation/
│
└── README.md
```

---

# Deployment Workflow

## Authenticate to Azure

```powershell
az login
az account show
```

## Initialize Terraform

```powershell
terraform init
```

## Validate Configuration

```powershell
terraform validate
```

## Review Deployment Plan

```powershell
terraform plan
```

## Deploy Infrastructure

```powershell
terraform apply
```

## Validate Terraform State

```powershell
terraform state list
```

---

# Terraform Managed Resources

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

# Project Highlights

## Monitoring and Alerting

Implemented Azure Monitor and Log Analytics to provide centralized monitoring and visibility across the environment.

Features include:

- CPU Alert Monitoring
- VM Insights
- Log Analytics Workspace
- Action Groups
- Data Collection Rules

### Validation

The following screenshots demonstrate successful monitoring deployment:

- Azure Monitor Alert Rules
- VM Insights Configuration
- Log Analytics Workspace
- Action Group Configuration

---

## Backup and Recovery

Implemented enterprise backup capabilities using Azure Recovery Services Vault.

Features include:

- Daily VM Backups
- 7-Day Retention Policy
- Centralized Backup Management
- Disaster Recovery Readiness

---

## Governance and Compliance

Implemented governance controls through:

- Azure Policy
- Resource Tagging
- RBAC
- Access Management

---

## Terraform State Management

Terraform was used to manage and validate all deployed resources.

Validation included:

- Resource Import Operations
- State Synchronization
- Drift Detection
- Infrastructure Validation

Terraform validation result:

```text
No changes. Infrastructure matches configuration.
```

---

# Skills Demonstrated

## Azure Administration

- Resource Group Management
- Virtual Networking
- Subnet Configuration
- Azure Bastion

## Identity & Security

- RBAC
- IAM
- Access Control
- Security Best Practices

## Monitoring

- Azure Monitor
- Log Analytics
- VM Insights
- Alerting

## Backup & Recovery

- Recovery Services Vault
- Backup Policies
- Retention Management

## Infrastructure as Code

- Terraform
- State Management
- Resource Imports
- Drift Detection

## Governance

- Azure Policy
- Resource Tagging
- Compliance Controls

---

# Lessons Learned

This project reinforced the importance of:

- Infrastructure as Code for repeatable deployments
- Monitoring and observability from day one
- Backup and recovery planning
- Governance and compliance controls
- Proper Terraform state management
- Operational validation and testing

---

# Documentation

Additional documentation is available in the `/docs` directory:

- Architecture Overview
- Deployment Guide
- Terraform Implementation
- Monitoring and Backup
- Lessons Learned

---

# Author

## Loyiso Nguza

**Microsoft Certified: Azure Administrator Associate (AZ-104)**

Passionate about Cloud Infrastructure, Azure Administration, Microsoft 365, Security, Automation, and Enterprise IT Operations.

### Connect

- LinkedIn: https://www.linkedin.com/in/loyiso-qonda-nguza-55317b69/
- GitHub: https://github.com/Qonda-tech

---

**Project Status:** Completed ✅

**Platform:** Microsoft Azure

**Infrastructure as Code:** Terraform

**Certification Alignment:** AZ-104 Azure Administrator Associate