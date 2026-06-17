# Lessons Learned

## Project Summary

This project was completed as part of my Azure Administrator (AZ-104) portfolio to demonstrate enterprise Azure administration skills.

---

## Skills Demonstrated

### Azure Infrastructure

- Resource Groups
- Virtual Networks
- Subnets
- NSGs
- Azure Bastion

### Identity and Access Management

- RBAC
- IAM Role Assignments

### Monitoring

- Azure Monitor
- Log Analytics
- VM Insights
- Alerts

### Backup and Recovery

- Recovery Services Vault
- Backup Policies

### Governance

- Azure Policy
- Resource Tagging

### Infrastructure as Code

- Terraform
- State Management
- Resource Imports
- Drift Detection

---

## Challenges Encountered

### Terraform Import Process

Imported existing Azure resources into Terraform state while maintaining configuration consistency.

### VM Insights Configuration

Configured Data Collection Rules and associations to successfully onboard monitoring.

### Azure Policy Deployment

Resolved deployment and validation issues during governance implementation.

---

## Key Takeaways

- Infrastructure should be managed through code whenever possible.
- Monitoring must be implemented from day one.
- Backup strategies should be tested and documented.
- Governance is critical for enterprise environments.
- Terraform provides repeatable and auditable deployments.

---

## Next Improvements

Future enhancements include:

- Azure Key Vault
- Azure Firewall
- Private Endpoints
- CI/CD using GitHub Actions
- Terraform Remote State Storage