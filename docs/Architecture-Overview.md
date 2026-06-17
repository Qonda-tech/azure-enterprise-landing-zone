# Azure Enterprise Landing Zone Architecture

## Overview

This project demonstrates the deployment of a secure Azure Enterprise Landing Zone using Microsoft Azure and Terraform.

The solution was designed to simulate a production enterprise environment while showcasing Azure Administrator (AZ-104) skills including:

- Networking
- Identity and Access Management
- Monitoring and Logging
- Backup and Recovery
- Governance and Compliance
- Infrastructure as Code (Terraform)

---

## Architecture Components

### Core Infrastructure

- Resource Group: RG-ENTERPRISE-PROD
- Virtual Network: vnet-enterprise-prod
- App Subnet: app-subnet
- Azure Bastion Subnet: AzureBastionSubnet

### Security

- Network Security Group (NSG)
- Azure RBAC
- Azure Policy

### Monitoring

- Log Analytics Workspace
- Azure Monitor
- VM Insights
- Action Groups
- CPU Alert Rules

### Backup

- Recovery Services Vault
- VM Backup Policy

### Automation

- Terraform AzureRM Provider
- Terraform State Management
- Resource Import Operations

---

## Architecture Diagram

Refer to:

/diagrams/Azure-Enterprise-Landing-Zone.png

---

## Outcome

The environment provides a secure, monitored and recoverable Azure platform that follows Azure best practices.