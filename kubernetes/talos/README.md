talosctl apply-config --insecure -n 10.1.1.21 -f ./clusterconfig/k8s-cluster-01-k8s-01.trentscholl.com.yaml
talosctl bootstrap --nodes 10.1.1.21 --endpoints 10.1.1.21 --talosconfig=./clusterconfig/talosconfig
talosctl kubeconfig --nodes 10.1.1.21 --endpoints 10.1.1.21


helm upgrade -i --namespace=kube-system -f ~/proxmox-ccm.yaml proxmox-cloud-controller-manager oci://ghcr.io/sergelogvinov/charts/proxmox-cloud-controller-manager