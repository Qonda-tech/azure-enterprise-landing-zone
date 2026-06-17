
---

# docs/Monitoring-and-Backup.md

```markdown
# Monitoring and Backup

## Monitoring Solution

Azure Monitor was implemented to provide operational visibility across deployed resources.

---

## Components

### Log Analytics Workspace

Workspace Name:

law-enterprise-prod

Purpose:

- Centralized log collection
- Performance monitoring
- Query and analysis

---

### VM Insights

Configured using:

- Data Collection Rule (DCR)
- Data Collection Rule Association (DCRA)

Collected Metrics:

- CPU Utilization
- Memory Usage

---

### Alerting

Alert Name:

alert-vm-admin01-high-cpu

Configuration:

- Metric: Percentage CPU
- Threshold: 80%
- Aggregation: Average
- Severity: Warning

---

### Action Group

Used for alert notification and escalation.

---

## Backup Solution

### Recovery Services Vault

Vault Name:

rsv-enterprise-prod

Purpose:

- Centralized backup management
- VM recovery protection

---

### Backup Policy

Policy Name:

bp-vm-daily-prod

Configuration:

- Daily Backup
- Backup Time: 23:00
- Retention: 7 Days

---

## Outcome

The environment now includes proactive monitoring, alerting and disaster recovery capabilities.