#!/usr/bin/env bash
#
## property is the master ip
HNAME=$(echo $(dcos config show core.dcos_url) | grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])')
echo Script name: $0
#echo $# arguments
echo $HNAME
#if [ $# -ne 1 ];
#    then echo "illegal number of parameters...pass the dcos master url"
#el
    kubectl config set-cluster dcos-k8s --server=http://localhost:9000
    kubectl config set-context dcos-k8s --cluster=dcos-k8s --namespace=default
    kubectl config use-context dcos-k8s
    echo "configuring ssh tunnel for $HNAME"
    ssh -4 -f -i ~/dcos_scripts/ccm.pem -N -L 9000:apiserver-insecure.kubernetes.l4lb.thisdcos.directory:9000 core@$HNAME
#fi