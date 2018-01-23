#!/usr/bin/env bash
set -x
#dcos package install --yes marathon-lb
#dcos package install --yes --cli dcos-enterprise-cli

dcos package install --yes --cli jenkins
dcos package install --yes gitlab --options=gitlab_options.json
dcos package install --yes mysql --option=mysql_options.json


dcos marathon app add gs-crud-with-vaadin.json