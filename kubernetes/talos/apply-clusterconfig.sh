#!/usr/bin/env bash

# Deploy the configuration to the nodes
talosctl apply-config -n 10.1.1.21 -f ./clusterconfig/k8s-cluster-01-k8s-01.trentscholl.com.yaml
