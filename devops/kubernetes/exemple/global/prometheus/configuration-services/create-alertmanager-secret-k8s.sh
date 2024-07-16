#!/bin/bash
#

sed "s/ALERTMANAGER_CONFIG/$(cat alertmanager-new.yml | base64 -w0)/g" alertmanager-template-secret-k8s.yaml > alertmanager-secret-k8s-generated.yaml
