#!/usr/bin/env bash
echo "Setup security rules"
dcos security org groups grant dept-a dcos:adminrouter:service:marathon full
dcos security org groups grant dept-a dcos:service:marathon:marathon:services:/dept-a full
dcos security org groups grant dept-a dcos:adminrouter:ops:slave full
dcos security org groups grant dept-a dcos:mesos:master:framework:role:slave_public read
dcos security org groups grant dept-a dcos:mesos:master:executor:app_id:/dept-a full
dcos security org groups grant dept-a dcos:mesos:master:task:app_id:/dept-a full
dcos security org groups grant dept-a dcos:mesos:agent:framework:role:slave_public read
dcos security org groups grant dept-a dcos:mesos:agent:executor:app_id:/dept-a full
dcos security org groups grant dept-a dcos:mesos:agent:task:app_id:/dept-a full
dcos security org groups grant dept-a dcos:mesos:agent:sandbox:app_id:/dept-a full