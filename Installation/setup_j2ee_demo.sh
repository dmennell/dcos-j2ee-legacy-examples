#!/usr/bin/env bash
dcos package install --yes marathon-lb
dcos package install --yes --cli dcos-enterprise-cli
dcos marathon app add ../Weblogic/demo_examples/benefits_autoscale.json

dcos security org groups create DeptA
dcos security org groups create DeptB
dcos security org users create -p password meatloaf
dcos security org users create -p password jsmith
dcos security org users create -p password jdoe
dcos security org groups add_user DeptA jsmith
dcos security org groups add_user DeptB jdoe
dcos security org groups grant DeptA dcos:adminrouter:service:marathon full
dcos security org groups grant DeptA dcos:service:marathon:marathon:services:/DeptA full
dcos security org groups grant DeptA dcos:adminrouter:ops:slave full
dcos security org groups grant DeptA dcos:mesos:master:framework:role:slave_public read
dcos security org groups grant DeptA dcos:mesos:master:executor:app_id:/DeptA read
dcos security org groups grant DeptA dcos:mesos:master:task:app_id:/DeptA read
dcos security org groups grant DeptA dcos:mesos:agent:framework:role:slave_public read
dcos security org groups grant DeptA dcos:mesos:agent:executor:app_id:/DeptA read
dcos security org groups grant DeptA dcos:mesos:agent:task:app_id:/DeptA read
dcos security org groups grant DeptA dcos:mesos:agent:sandbox:app_id:/DeptA read

dcos security org groups grant DeptB dcos:adminrouter:service:marathon full
dcos security org groups grant DeptB dcos:service:marathon:marathon:services:/DeptB full
dcos security org groups grant DeptB dcos:adminrouter:package full