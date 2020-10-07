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
- Grafana

## TODO: 
- Modify PromQL for Grafana Dashboard
    - 10300 : kube
    - 9746 : ES
    - 11074 : Node Exporter
- Load Balancer to Ingress
- Namespace 정리
- Cluster 옵션 수정
- Thanos 적용    
