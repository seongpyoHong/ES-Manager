## ES Manager

다양한 Cloud Platform(AWS, GCP 등)에 Elasticsearch Cluster를 배포 및 Elasticsearch 관리를 위한 Open Source 제공



### 기술 스택

- Terraform - Cloud Resource Procvisioning

- Helm - Deploy Elasticsearch Cluster in Kubernetes

- Spring Boot - Backend

- Open Source
  - Kibana - Elasticsearch Dashboard	
  - cerebro - Elasticsearch Index Management



### 제공 기능

- **배포 할 Cloue Platform 선택**

- **Elasticsearch의 Configuration을 사용자에 맞게 설정하여 Cloud에 배포**
  - 노드 Spec 
  - Hot-Warm Node 수
  - Elasticsearch Configuration 수정 가능
  - ES Version 선택
  - ES 유저 Secret 세팅

- **Endpoint 제공**
  - Elasticsearch
  - Kibana
  - cerebro



### 미정
- Grafana를 통한 Metric 제공
- Backup Storage 제공

### TODO
- [ ] Helm Chart 생성 
- [ ] LoadBalancer -> Ingress
- [ ] Terraform 적용
- [ ] Web Interface 생성