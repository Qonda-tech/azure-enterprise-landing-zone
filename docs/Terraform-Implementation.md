# Terraform Implementation

## Objective

Deploy and manage Azure infrastructure using Infrastructure as Code (IaC).

---

## Terraform Resources Managed

### Networking

- Resource Group
- Virtual Network
- Application Subnet
- Bastion Subnet
- Network Security Group

### Monitoring

- Log Analytics Workspace
- Action Group
- Metric Alert
- Data Collection Rule
- Data Collection Rule Association

### Backup

- Recovery Services Vault
- VM Backup Policy

---

## Provider

```terraform
provider "azurerm" {
  features {}
}