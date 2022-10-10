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
- [x] Deploy jenkins  and nexus

Access VM via **ssh** through IAP
---

```bash
gcloud compute ssh --zone "us-central1-a" "test-vm"  --tunnel-through-iap --project "anwer-gcp"
```

Get GKE cluster credentials
---

```bash
gcloud container clusters get-credentials vois-cluster --zone us-central1-c --project anwer-gcp
```

Connect to gke cluster though IAP using test_vm as a reverse proxy 

```bash
gcloud container clusters get-credentials "vois-cluster" --zone "us-central1-c" --project "anwer-gcp" && gcloud compute ssh "test-vm" --project "anwer-gcp"  --zone "us-central1-a" -- -4 -L8888:localhost:8888 -N -q -f && export HTTPS_PROXY=localhost:8888
```

install kubectl
---

```bash

    3  gcloud components list
    4  gcloud components install kubectl
    5  sudo yum install kubectl
    6  gcloud container clusters get-credentials "vois-cluster" --zone "us-central1-c" --project "anwer-gcp" 
    7  gcloud components install gke-gcloud-auth-plugin
    8  sudo yum install google-cloud-sdk-gke-gcloud-auth-plugin
    9  gcloud container clusters get-credentials "vois-cluster" --zone "us-central1-c" --project "anwer-gcp" 
   10  kubectl get po
   11  git clone https://github.com/mohamedanwer006/terraform-infra-gcp.git
   12  sudo yum install git
   13  git clone https://github.com/mohamedanwer006/terraform-infra-gcp.git
   14  cd terraform-infra-gcp/
   15  ls
   17  kubectl apply -f k8s/namespaces.yaml 
   18  kubectl apply -Rf k8s/
   19  history 

   ```

   ![alt](./assets/Screenshot%20from%202022-10-10%2023-22-29.png)