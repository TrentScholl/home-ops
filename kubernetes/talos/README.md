
talosctl apply-config --insecure -n 10.1.1.21 -f ./clusterconfig/k8s-cluster-01-k8s-node-01.trentscholl.com.yaml
talosctl apply-config --insecure -n 10.1.1.22 -f ./clusterconfig/k8s-cluster-01-k8s-node-02.trentscholl.com.yaml
talosctl apply-config --insecure -n 10.1.1.23 -f ./clusterconfig/k8s-cluster-01-k8s-node-03.trentscholl.com.yaml

talosctl bootstrap --nodes 10.1.1.21 --endpoints k8s-cluster-01.trentscholl.com --talosconfig=./clusterconfig/talosconfig
talosctl kubeconfig --nodes 10.1.1.21 --endpoints k8s-cluster-01.trentscholl.com

./deploy-integrations.sh

helm upgrade -i --namespace=kube-system -f ~/proxmox-ccm.yaml proxmox-cloud-controller-manager oci://ghcr.io/sergelogvinov/charts/proxmox-cloud-controller-manager

kubectl create ns csi-proxmox
kubectl label ns/csi-proxmox pod-security.kubernetes.io/enforce=privileged
helm upgrade -i --namespace=csi-proxmox -f ~/proxmox-csi.yaml proxmox-csi-plugin oci://ghcr.io/sergelogvinov/charts/proxmox-csi-plugin



--------


kubectl label nodes k8s-node-01 topology.kubernetes.io/zone=vm-01 --overwrite
kubectl label nodes k8s-node-01 topology.kubernetes.io/region=vm-cluster-01 --overwrite


kubectl create ns csi-proxmox
kubectl label ns/csi-proxmox pod-security.kubernetes.io/enforce=privileged
helm upgrade -i --namespace=csi-proxmox -f ~/proxmox-csi.yaml proxmox-csi-plugin oci://ghcr.io/sergelogvinov/charts/proxmox-csi-plugin