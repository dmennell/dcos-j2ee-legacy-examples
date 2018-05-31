#!/usr/bin/env bash
dcos package install --yes marathon-lb
dcos package install --yes --cli dcos-enterprise-cli
#dcos package install --yes jenkins

dcos marathon app add ../Weblogic/demo_examples/benefits_autoscale.json
#echo "Deploy benefits"
#dcos marathon app add ../Weblogic/demo_examples/weblogic_benefits_deploy.json
echo "Deploy Sample"
dcos marathon app add ../Weblogic/demo_examples/weblogic_sample_deploy.json


echo "Setup security rules"
dcos security org groups create dept-a
dcos security org groups create dept-b
dcos security org users create -p password meatloaf
dcos security org users create -p password jsmith
dcos security org users create -p password jdoe
dcos security org groups add_user dept-a jsmith
dcos security org groups add_user dept-b jdoe
dcos security org groups grant dept-a dcos:adminrouter:service:marathon full
dcos security org groups grant dept-a dcos:service:marathon:marathon:services:/dept-a full
dcos security org groups grant dept-a dcos:adminrouter:ops:slave full
dcos security org groups grant dept-a dcos:mesos:master:framework:role:slave_public read
dcos security org groups grant dept-a dcos:mesos:master:executor:app_id:/dept-a full
dcos security org groups grant dept-a dcos:mesos:master:task:app_id:/dept-a full
dcos security org groups grant dept-a dcos:mesos:agent:framework:role:slave_public read
dcos security org groups grant dept-a dcos:mesos:agent:executor:app_id:/dept-a read
dcos security org groups grant dept-a dcos:mesos:agent:task:app_id:/dept-a read
dcos security org groups grant dept-a dcos:mesos:agent:sandbox:app_id:/dept-a read

dcos security org groups grant dept-b dcos:adminrouter:service:marathon full
dcos security org groups grant dept-b dcos:service:marathon:marathon:services:/dept-b full
dcos security org groups grant dept-b dcos:adminrouter:package full