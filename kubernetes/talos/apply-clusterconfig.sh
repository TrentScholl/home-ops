#!/usr/bin/env bash

# Deploy the configuration to the nodes
talosctl apply-config -n 10.1.1.21 -f ./clusterconfig/k8s-cluster-01-k8s-node-01.trentscholl.com.yaml
talosctl apply-config -n 10.1.1.22 -f ./clusterconfig/k8s-cluster-01-k8s-node-02.trentscholl.com.yaml
talosctl apply-config -n 10.1.1.23 -f ./clusterconfig/k8s-cluster-01-k8s-node-03.trentscholl.com.yaml
