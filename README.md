Terraform GCP 
====



ToDo
----

- [x] main files 
- [x] Network module
- [x] service accounts 
- [x] gke  module
- [x] gs bucket module
- [x] vm instance module
- [x] bigquery module
- [ ] Deploy jenkins  and nexus

Access VM via **ssh** through IAP
---

```bash
gcloud compute ssh --zone "us-central1-a" "test-vm"  --tunnel-through-iap --project "anwer-gcp"
```

Get GKE cluster credentials
---

```bash
gcloud container clusters get-credentials vois-cluster --zone us-central1-f --project anwer-gcp
```

Connect to gke cluster though IAP using test_vm as a reverse proxy 

```bash
gcloud container clusters get-credentials gke-cluster --zone us-central1-f --project "anwer-gcp" ; gcloud compute ssh "test-vm" --project "anwer-gcp"  --zone "us-central1-a" -- -4 -L8888:localhost:8888 -N -q -f && export HTTPS_PROXY=localhost:8888
```








