#!/usr/bin/env bash
dcos marathon app remove /dept-b/weblogic-sample-app
dcos marathon app remove /dept-a/weblogic-benefits-app

dcos security org groups delete dept-b
dcos security org groups delete dept-a
dcos security org users delete meatloaf
dcos security org users delete jsmith
dcos security org users delete jdoe