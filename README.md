## Elaistcsearch Helm Chart
- elasticsearch : Helm Charts for Elasticsearch
- image : Elasticsearch / Kibana / Cerebro Docker Image
- terraform : Settings the GKE Cluster for this chart.

---
### Component

#### Elasticsearch Cluster
- Master & Master Eligible Node
- Data Node (Hot/Warm)
- Client Node (Coordinating Node)

#### Elasticsearch Mangement
- Cerebro
- Kibana
- Curator (CronJob)

#### Cluster Monitoring
- Prometheus
- Elasticsearch Exporter
- Node Exporter
- Kube State Metrics
