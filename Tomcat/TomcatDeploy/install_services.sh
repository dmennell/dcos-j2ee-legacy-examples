#!/usr/bin/env bash
set -x
#dcos package install --yes marathon-lb
dcos package install --yes --cli jenkins
dcos package install --yes --cli dcos-enterprise-cli
dcos package install --yes gitlab --options=Tomcat_MySQL/gitlab_options.json
dcos package install --yes mysql --option=mysql_options.json

